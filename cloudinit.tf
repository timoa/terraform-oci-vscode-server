# Update the Cloud Init template
data "template_file" "template" {
  template = file("./cloudinit/template.yml")

  vars = {
    user           = var.instance_os_user
    vscode_version = var.vscode_version
  }
}

# Generate the Cloud Init config file
data "template_cloudinit_config" "cloudinit" {
  gzip          = false
  base64_encode = false

  # Configure the instance & Instance VSCode Server
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.template.rendered
  }
}
