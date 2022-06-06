locals {
  cloudinit = templatefile("${path.root}/templates/cloudinit.tftpl", {
    user = var.instance_os_user
  })
}

# Generate the Cloud Init config file
data "cloudinit_config" "cloudinit" {

  # Configure the instance
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = local.cloudinit
  }
}
