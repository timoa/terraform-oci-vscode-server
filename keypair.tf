locals {
  key_name = var.keypair_name != null ? var.keypair_name : "${var.namespace}-keypair-${var.stage}"

  public_key_filename = format(
    "%s%s",
    local.key_name,
    var.keypair_public_key_extension
  )

  public_key_path = format(
    "%s/%s",
    var.keypair_public_key_path,
    local.public_key_filename
  )

  private_key_filename = format(
    "%s%s",
    local.key_name,
    var.keypair_private_key_extension
  )

  private_key_path = format(
    "%s/%s",
    var.keypair_public_key_path,
    local.private_key_filename
  )
}

# Generate the key pair
resource "tls_private_key" "default" {
  count     = var.keypair_public_key != null ? 0 : 1
  algorithm = var.keypair_key_algorithm
}

resource "local_file" "public_key_openssh" {
  count      = var.keypair_public_key != null ? 0 : 1
  depends_on = [tls_private_key.default]
  content    = tls_private_key.default[0].public_key_openssh
  filename   = local.public_key_path
}

resource "local_file" "private_key_pem" {
  count      = var.keypair_public_key != null ? 0 : 1
  depends_on = [tls_private_key.default]
  content    = tls_private_key.default[0].private_key_pem
  filename   = local.private_key_path
}

# Change permission to the Public Key
resource "null_resource" "public_key_chmod" {
  count      = var.keypair_public_key != null && var.keypair_chmod_command_public != "" ? 0 : 1
  depends_on = [local_file.public_key_openssh]

  triggers = {
    local_file_public_key_openssh = "local_file.public_key_openssh"
  }

  provisioner "local-exec" {
    command = format(var.keypair_chmod_command_public, local.public_key_path)
  }
}

# Change permission to the Private Key
resource "null_resource" "private_key_chmod" {
  count      = var.keypair_private_key != null && var.keypair_chmod_command_private != "" ? 1 : 0
  depends_on = [local_file.private_key_pem]

  triggers = {
    local_file_private_key_pem = "local_file.private_key_pem"
  }

  provisioner "local-exec" {
    command = format(var.keypair_chmod_command_private, local.private_key_path)
  }
}
