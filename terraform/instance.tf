locals {
  instance_name         = "${var.namespace}-instance-${var.stage}"
  instance_vnic_name    = "${var.namespace}-vnic-${var.stage}"
  block_volume_name     = "${var.namespace}-volume-${var.stage}"
  instance_image_filter = ["^${replace(var.instance_os, " ", "-")}-${var.instance_os_version}-aarch64-([\\.0-9-]+)$"]
}

# Images
data "oci_core_images" "ubuntu_20_04_aarch64" {

  # Global
  compartment_id = var.compartment_ocid

  # Image
  operating_system         = var.instance_os
  operating_system_version = var.instance_os_version
  filter {
    name   = "display_name"
    values = local.instance_image_filter
    regex  = true
  }
}

# Instance
resource "oci_core_instance" "instance" {

  # Global
  compartment_id      = var.compartment_ocid
  availability_domain = local.availability_domain
  display_name        = local.instance_name

  # Instance
  shape = var.instance_shape
  shape_config {
    ocpus         = var.instance_ocpus
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
  }

  # Network
  create_vnic_details {
    subnet_id                 = oci_core_subnet.subnet.id
    display_name              = local.instance_vnic_name
    assign_public_ip          = true
    assign_private_dns_record = true
    hostname_label            = local.instance_name
  }

  # Image
  source_details {
    source_type             = "image"
    source_id               = data.oci_core_images.ubuntu_20_04_aarch64.images[0].id
    boot_volume_size_in_gbs = 50
  }

  # Launch Options
  launch_options {
    #checkov:skip=CKV_OCI_4: Can't apply encryption in transit on preemptible instances
    # is_pv_encryption_in_transit_enabled = true
    network_type = "PARAVIRTUALIZED"
  }

  # Instance Options
  instance_options {
    are_legacy_imds_endpoints_disabled = true
  }

  metadata = {
    ssh_authorized_keys = tls_private_key.default[0].public_key_openssh
    user_data           = data.cloudinit_config.cloudinit.rendered
  }

  preemptible_instance_config {
    preemption_action {
      type                 = "TERMINATE"
      preserve_boot_volume = false
    }
  }

  timeouts {
    create = "60m"
  }

  # Labels
  freeform_tags = local.common_labels
}
