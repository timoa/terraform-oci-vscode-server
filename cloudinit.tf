locals {
  cloudinit = templatefile("${path.root}/cloudinit/template.tftpl", {
    user           = var.instance_os_user
    vscode_version = var.vscode_version
  })
}

# Generate the Cloud Init config file
data "cloudinit_config" "cloudinit" {

  # Configure the instance + install VSCode Server
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = local.cloudinit
  }
}
