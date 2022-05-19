# Create the Block Volume
resource "oci_core_volume" "volume" {

  #checkov:skip=CKV_OCI_2: The 'backup_policy_id' field has been deprecated.

  # Global
  compartment_id      = var.compartment_ocid
  availability_domain = local.availability_domain
  display_name        = local.block_volume_name

  # Volume
  size_in_gbs = var.block_volume_size

  # Encryption
  #checkov:skip=CKV_OCI_3: Volume Encryption with KMS will come in the next release
  # is_pv_encryption_in_transit_enabled = true

  # Labels
  freeform_tags = local.common_labels
}

# Volume attachment
resource "oci_core_volume_attachment" "volume_attachment" {

  # Global
  attachment_type = "iscsi"
  instance_id     = oci_core_instance.instance.id
  volume_id       = oci_core_volume.volume.id
  device          = var.block_volume_device_name

  # Security
  use_chap = true
}

# Mount the Block Volume
resource "null_resource" "remote_exec" {
  depends_on = [
    oci_core_instance.instance,
    oci_core_volume_attachment.volume_attachment,
  ]

  triggers = {
    volume_attachment_id = oci_core_volume_attachment.volume_attachment.id # Trigger on volume attachment changes
  }

  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "30m"
      host        = oci_core_instance.instance.public_ip
      user        = var.instance_os_user
      private_key = tls_private_key.default[0].private_key_openssh
    }

    inline = [
      "sudo mkdir -p /data",
      "sudo chown ${var.instance_os_user}:${var.instance_os_user} /data", # Add user permission to /data
      "sudo iscsiadm -m node -o new -T ${oci_core_volume_attachment.volume_attachment.iqn} -p ${oci_core_volume_attachment.volume_attachment.ipv4}:${oci_core_volume_attachment.volume_attachment.port}",
      "sudo iscsiadm -m node -o update -T ${oci_core_volume_attachment.volume_attachment.iqn} -n node.startup -v automatic",
      "sudo iscsiadm -m node -T ${oci_core_volume_attachment.volume_attachment.iqn} -p ${oci_core_volume_attachment.volume_attachment.ipv4}:${oci_core_volume_attachment.volume_attachment.port} -o update -n node.session.auth.authmethod -v CHAP",
      "sudo iscsiadm -m node -T ${oci_core_volume_attachment.volume_attachment.iqn} -p ${oci_core_volume_attachment.volume_attachment.ipv4}:${oci_core_volume_attachment.volume_attachment.port} -o update -n node.session.auth.username -v ${oci_core_volume_attachment.volume_attachment.chap_username}",
      "sudo iscsiadm -m node -T ${oci_core_volume_attachment.volume_attachment.iqn} -p ${oci_core_volume_attachment.volume_attachment.ipv4}:${oci_core_volume_attachment.volume_attachment.port} -o update -n node.session.auth.password -v ${oci_core_volume_attachment.volume_attachment.chap_secret}",
      "sudo iscsiadm -m node -T ${oci_core_volume_attachment.volume_attachment.iqn} -p ${oci_core_volume_attachment.volume_attachment.ipv4}:${oci_core_volume_attachment.volume_attachment.port} -l",
      "sleep 5",                                                                                                                            # Wait for the volume to be mounted
      "sudo blkid $(readlink -f ${var.block_volume_device_name}) || sudo mkfs -t ext4 $(readlink -f ${var.block_volume_device_name})",      # Format the volume if needed
      "sudo e2label $(readlink -f ${var.block_volume_device_name}) instance-data",                                                          # Set the label
      "sudo sed  -i -e '/^[\\/][^ \t]*[ \t]*\\/data[ \t]/d' /etc/fstab",                                                                    # Remove the old entry
      "sudo grep -q ^LABEL=instance-data /etc/fstab || echo 'LABEL=instance-data /data ext4 defaults' | sudo tee -a /etc/fstab >/dev/null", # Add the new entry
      "sudo grep -q \"^$(readlink -f ${var.block_volume_device_name}) /data \" /proc/mounts || sudo mount /data",                           # Mount the volume
    ]
  }
}
