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