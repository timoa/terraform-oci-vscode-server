locals {
  cloudinit = templatefile("${path.root}/templates/cloudinit.tftpl", {
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

# Mount the Block Volume + enable VSCode Server
# resource "null_resource" "post_install" {
#   depends_on = [
#     oci_core_instance.instance,
#     oci_core_volume_attachment.volume_attachment,
#   ]

#   triggers = {
#     volume_attachment_id = oci_core_volume_attachment.volume_attachment.id # Trigger on volume attachment changes
#   }

#   provisioner "remote-exec" {
#     connection {
#       agent       = false
#       timeout     = "30m"
#       host        = oci_core_instance.instance.public_ip
#       user        = var.instance_os_user
#       private_key = tls_private_key.default[0].private_key_openssh
#     }

#     inline = [                                                                              # Enable the Code Server at boot
#     ]
#   }
# }
