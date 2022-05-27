#############################
# Configure Ansible
#############################

# Create the Ansible inventory file (hosts)
resource "local_file" "ansible_hosts" {

  count = var.maintenance_mode ? 0 : 1

  content = templatefile("${path.root}/templates/ansible_hosts.tftpl", {
    public_ip   = oci_core_instance.instance[0].public_ip
    hostname    = local.instance_name
    user        = var.instance_os_user
    private_key = replace(local.private_key_path, "./", "../terraform/")
  })
  filename = "${path.root}/../ansible/hosts.yml"
}

# Create the Ansible variables file (vars.yml)
resource "local_file" "ansible_variables" {

  count = var.maintenance_mode ? 0 : 1

  content = templatefile("${path.root}/templates/ansible_vars.tftpl", {
    user                 = var.instance_os_user
    volume_iqn           = oci_core_volume_attachment.volume_attachment[0].iqn
    volume_ipv4          = oci_core_volume_attachment.volume_attachment[0].ipv4
    volume_port          = oci_core_volume_attachment.volume_attachment[0].port
    volume_chap_username = oci_core_volume_attachment.volume_attachment[0].chap_username
    volume_chap_password = oci_core_volume_attachment.volume_attachment[0].chap_secret
    volume_device_name   = var.block_volume_device_name
    vscode_version       = var.vscode_version
  })
  filename = "${path.root}/../ansible/group_vars/server/all.yml"
}

#############################
# Install the packages
#############################

# Install Common roles
resource "null_resource" "common_playbook" {
  depends_on = [
    null_resource.mount_data_volume
  ]

  provisioner "local-exec" {
    command = "bash ${path.root}/../ansible/playbooks/common/run.sh"
  }
}

# Install DevOps roles (if enabled)
resource "null_resource" "devops_roles" {

  count = var.install_devops_deps ? 1 : 0

  depends_on = [
    null_resource.mount_data_volume,
    null_resource.common_playbook,
  ]

  provisioner "local-exec" {
    command = "bash ${path.root}/../ansible/playbooks/for-devops/run.sh"
  }
}
