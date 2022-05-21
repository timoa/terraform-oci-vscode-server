
# Create the Ansible inventory file (hosts)
resource "local_file" "ansible_hosts" {
  content = templatefile("${path.root}/templates/ansible_hosts.tftpl", {
    public_ip   = oci_core_instance.instance.public_ip
    hostname    = local.instance_name
    user        = var.instance_os_user
    private_key = replace(local.private_key_path, "./", "../terraform/")
  })
  filename = "${path.root}/../ansible/hosts.yml"
}

# Create the Ansible variables file (vars.yml)
resource "local_file" "ansible_variables" {
  content = templatefile("${path.root}/templates/ansible_vars.tftpl", {
    user                 = var.instance_os_user
    volume_iqn           = oci_core_volume_attachment.volume_attachment.iqn
    volume_ipv4          = oci_core_volume_attachment.volume_attachment.ipv4
    volume_port          = oci_core_volume_attachment.volume_attachment.port
    volume_chap_username = oci_core_volume_attachment.volume_attachment.chap_username
    volume_chap_password = oci_core_volume_attachment.volume_attachment.chap_secret
    volume_device_name   = var.block_volume_device_name
    vscode_version       = var.vscode_version
  })
  filename = "${path.root}/../ansible/group_vars/server/all.yml"
}
