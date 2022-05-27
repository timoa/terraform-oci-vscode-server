source "oracle-oci" "vscode_server" {

  # Global
  compartment_ocid = var.compartment_ocid

  # Location
  region = var.region
  availability_domain = var.availability_domain

  # Network
  subnet_ocid = var.subnet_ocid

  # Image
  base_image_filter {
    operating_system = var.base_image_os
    operating_system_version = var.base_image_os_version
    display_name_search = "^${replace(var.base_image_os, " ", "-")}-${var.base_image_os_version}-aarch64-([\\.0-9-]+)$"
  }
  image_name        = "${var.namespace}-v{{isotime \"20060102030405\"}}"

  # Instance
  instance_name = "${var.namespace}-packer"
  shape = var.instance_shape
  shape_config {
    ocpus         = var.instance_ocpus
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
  }
  ssh_username = var.base_image_os_user

  # Tags
  tags = {
    businessunit = var.businessUnit
    team = var.team
    project = var.project
    packer = "true"
  }
}

build {
  sources = ["source.oracle-oci.vscode_server"]

  provisioner "shell" {
    inline = ["timeout 30s bash -c \"while ! [ -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting on cloud-init...'; sleep 2; done\""]
  }

  # Install OS Updates
  provisioner "ansible" {
    ansible_env_vars = ["ANSIBLE_PYTHON_INTERPRETER=auto"]
    playbook_file    = "${path.root}/../ansible/playbooks/core/os-updates.yml"
    user             = var.base_image_os_user
  }

  # Install VS Code Server
  provisioner "ansible" {
    ansible_env_vars = ["ANSIBLE_PYTHON_INTERPRETER=auto"]
    extra_arguments  = ["-e", "{\"vscode_version\":\"${var.vscode_version}\"}", "-e", "{\"user\":\"${var.base_image_os_user}\"}"]
    playbook_file    = "${path.root}/../ansible/playbooks/core/vscode-server.yml"
    user             = var.base_image_os_user
  }

  # Install Core packages
  provisioner "ansible" {
    ansible_env_vars = ["ANSIBLE_PYTHON_INTERPRETER=auto"]
    extra_arguments  = ["-e", "{\"vscode_version\":\"${var.vscode_version}\"}", "-e", "{\"user\":\"${var.base_image_os_user}\"}"]
    playbook_file    = "${path.root}/../ansible/playbooks/core/install.yml"
    # galaxy_file      = "${path.root}/../ansible/playbooks/core/requirements.yml"
    user             = var.base_image_os_user
  }

  # Install packages for DevOps (optional)
  provisioner "ansible" {
    ansible_env_vars = ["ANSIBLE_PYTHON_INTERPRETER=auto"]
    playbook_file    = "${path.root}/../ansible/playbooks/for-devops/install.yml"
    galaxy_file      = "${path.root}/../ansible/playbooks/for-devops/requirements.yml"
    user             = var.base_image_os_user
  }
}
