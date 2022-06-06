locals {
  install_devops_deps = var.install_devops_deps ? "enabled" : "disabled"
}

#############################
# Configure Ansible
#############################

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
    cf_account_id        = var.cf_zero_trust_enabled ? var.cf_account_id : ""
    cf_tunnel_id         = var.cf_zero_trust_enabled ? cloudflare_argo_tunnel.cf_tunnel[0].id : ""
    cf_tunnel_name       = var.cf_zero_trust_enabled ? local.cf_tunnel_name : ""
    cf_tunnel_secret     = var.cf_zero_trust_enabled ? local.cf_argo_secret : ""
    cf_zone              = var.cf_zero_trust_enabled ? local.cf_cname : ""
    terraform_version    = var.terraform_version
    tfdocs_version       = var.tfdocs_version
    tfsec_version        = var.tfsec_version
    tflint_version       = var.tflint_version
    packer_version       = var.packer_version
    helm_version         = var.helm_version
    kubectl_version      = var.kubectl_version
  })
  filename = "${path.root}/../ansible/group_vars/server/all.yml"
}

#############################
# Install the packages
#############################

# Install Common roles
resource "null_resource" "common_playbook" {
  depends_on = [
    oci_core_instance.instance,
    oci_core_volume_attachment.volume_attachment,
  ]

  triggers = {
    volume_attachment_id = oci_core_volume_attachment.volume_attachment.id                      # Trigger on volume attachment changes
    common_playbook_id   = filemd5("${path.root}/../ansible/playbooks/common/playbook.yml")     # Trigger on playbook changes
    common_run_id        = filemd5("${path.root}/../ansible/playbooks/common/run.sh")           # Trigger on run script changes
    devops_playbook_id   = filemd5("${path.root}/../ansible/playbooks/for-devops/playbook.yml") # Trigger on playbook changes
    devops_run_id        = filemd5("${path.root}/../ansible/playbooks/for-devops/run.sh")       # Trigger on run script changes
  }

  # Attach the volume and mount it on the /data directory
  provisioner "local-exec" {
    command = "ansible-playbook -i ${path.root}/../ansible/hosts.yml ${path.root}/../ansible/playbooks/oci-data-volume.yml"
  }

  # Install the Common packages
  provisioner "local-exec" {
    command = "bash ${path.root}/../ansible/playbooks/common/run.sh"
  }

  # Install the DevOps packages (if enabled)
  provisioner "local-exec" {
    command = "bash ${path.root}/../ansible/playbooks/for-devops/run.sh ${local.install_devops_deps}"
  }

}

# Install Cloudflare agent
resource "null_resource" "cloudflare_playbook" {

  count = var.cf_zero_trust_enabled ? 1 : 0

  depends_on = [
    cloudflare_tunnel_route.cf_tunnel_route,
    null_resource.common_playbook,
  ]

  triggers = {
    volume_attachment_id = oci_core_volume_attachment.volume_attachment.id                      # Trigger on volume attachment changes
    playbook_id          = filemd5("${path.root}/../ansible/playbooks/cloudflare/playbook.yml") # Trigger on playbook changes
    run_id               = filemd5("${path.root}/../ansible/playbooks/cloudflare/run.sh")       # Trigger on run script changes
  }

  provisioner "local-exec" {
    command = "bash ${path.root}/../ansible/playbooks/cloudflare/run.sh"
  }
}
