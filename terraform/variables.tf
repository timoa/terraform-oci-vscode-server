#############################
# Global
#############################

variable "namespace" {
  type        = string
  description = "Project name that will be use to identifiy the resources"
  default     = "vscode"
}

variable "stage" {
  type        = string
  description = "Stage/environment name to tag and suffix the infrastructure composants"
  default     = "dev"
}

#############################
# Oracle Cloud Infrastructure
#############################

variable "tenancy_ocid" {
  type        = string
  description = "Tenancy OCID"
  default     = null # Set with TF_VAR_tenancy_ocid environment variable on ~/.zprofile or ~/.bash_profile
}

variable "compartment_ocid" {
  type        = string
  description = "Compartment OCID"
  default     = null # Set with TF_VAR_compartment_ocid environment variable on ~/.zprofile or ~/.bash_profile
}

variable "user_ocid" {
  type        = string
  description = "User OCID"
  default     = null # Set with TF_VAR_user_ocid environment variable on ~/.zprofile or ~/.bash_profile
}

variable "fingerprint" {
  type        = string
  description = "Fingerprint"
  default     = null # Set with TF_VAR_fingerprint environment variable on ~/.zprofile or ~/.bash_profile
}

variable "private_key" {
  type        = string
  description = "Private Key content"
  default     = null # Set with TF_VAR_private_key environment variable on ~/.zprofile or ~/.bash_profile
}

#############################
# Location
#############################

variable "region" {
  type        = string
  description = "Default Region"
  default     = "uk-london-1"
}

#############################
# Cloudflare Zero Trust
#############################

variable "cf_zero_trust_enabled" {
  type        = bool
  description = "Register VSCode with Cloudflare Zero Trust"
  default     = false
}

variable "cf_account_id" {
  type        = string
  description = "Set by TF_VAR_cf_account_id environment variable on ~/.zprofile or ~/.bash_profile"
  default     = null
  sensitive   = true
}

variable "cf_domain" {
  type        = string
  description = "Domain Name for Cloudflare Zero Trust"
  default     = "example.com"
}

variable "cf_subdomain" {
  type        = string
  description = "Subdomain Name for Cloudflare Zero Trust"
  default     = "vscode"
}

variable "cf_allowed_users" {
  type        = list(string)
  description = "Users (emails) allowed to access the VSCode Server application"
  default     = []
}

#############################
# Security Lists
#############################

variable "allowed_ingress_ssh" {
  type        = list(string)
  description = "List of IPs allowed to SSH on the instance"
  default     = []
}

variable "allowed_egress_ssh" {
  type        = list(string)
  description = "List of IPs the instance is allowed to connect"
  default     = ["0.0.0.0/0"]
}

variable "allowed_ingress_vscode" {
  type        = list(string)
  description = "List of IPs allowed to access to VS Code Server"
  default     = []
}

variable "allowed_egress_vscode" {
  type        = list(string)
  description = "List of IPs the instance is allowed to connect"
  default     = ["0.0.0.0/0"]
}

#############################
# Instance
#############################

variable "instance_shape" {
  type        = string
  description = "Instance Shape"
  default     = "VM.Standard.A1.Flex"
}

variable "instance_ocpus" {
  type        = string
  description = "Number of OCPUS (CPU cores)"
  default     = 4
}

variable "instance_shape_config_memory_in_gbs" {
  type        = string
  description = "Memory in GBs"
  default     = 24
}

variable "instance_os" {
  type        = string
  description = "Instance OS"
  default     = "Canonical Ubuntu"
}

variable "instance_os_version" {
  type        = string
  description = "Instance OS Version"
  default     = "20.04"
}

variable "instance_os_user" {
  type        = string
  description = "Instance User"
  default     = "ubuntu" # opc if Oracle Linux
}

#############################
# Block Volume (/data)
#############################

variable "block_volume_size" {
  type        = string
  description = "Block Volume size in GBs (/data)"
  default     = 100
}

variable "block_volume_device_name" {
  type        = string
  description = "Block Volume device name (/dev/oracleoci/oraclevdb)"
  default     = "/dev/oracleoci/oraclevdb"
}

#############################
# VS Code Server
#############################

variable "vscode_version" {
  type        = string
  description = "VS Code Server Version"
  default     = "4.4.0"
}

#############################
# VS Code Server Dependencies
#############################

variable "install_devops_deps" {
  type        = bool
  description = "Install DevOps tools like Docker, Helm, Terraform, Ansible, etc."
  default     = false
}

#############################
# DevOps Tools
#############################

variable "terraform_version" {
  type        = string
  description = "Terraform Version"
  default     = "1.2.1"
}

variable "tfdocs_version" {
  type        = string
  description = "Terraform Docs Version"
  default     = "0.16.0"
}

variable "tfsec_version" {
  type        = string
  description = "TFSec Version"
  default     = "1.21.2"
}

variable "tflint_version" {
  type        = string
  description = "TFLint Version"
  default     = "0.37.0"
}

variable "packer_version" {
  type        = string
  description = "Packer Version"
  default     = "1.8.1"
}

variable "helm_version" {
  type        = string
  description = "Helm Version"
  default     = "3.9.0"
}

variable "kubectl_version" {
  type        = string
  description = "Kubectl Version"
  default     = "1.24.0"
}

#############################
# Key Pairs
#############################

variable "keypair_name" {
  type        = string
  description = "Name of the Key Pair (instance or service for ex.)"
  default     = null
}

variable "keypair_public_key" {
  type        = string
  description = "A pregenerated OpenSSH-formatted public key. Changing this creates a new keypair. If a public key is not specified, then a public/private key pair will be automatically generated. If a pair is created, then destroying this resource means you will lose access to that keypair forever."
  default     = null
}

variable "keypair_public_key_path" {
  type        = string
  description = "Path to Public Key directory (e.g. `/keypairs`)"
  default     = "./keypairs"
}

variable "keypair_key_algorithm" {
  type        = string
  description = "Key Pair algorithm"
  default     = "RSA"
}

variable "keypair_private_key" {
  type        = string
  description = "A pregenerated OpenSSH-formatted private key. Changing this creates a new keypair. If a private key is not specified, then a public/private key pair will be automatically generated. If a pair is created, then destroying this resource means you will lose access to that keypair forever."
  default     = null
}

variable "keypair_private_key_extension" {
  type        = string
  description = "Private key extension"
  default     = ""
}

variable "keypair_public_key_extension" {
  type        = string
  description = "Public key extension"
  default     = ".pub"
}

variable "keypair_chmod_command_public" {
  type        = string
  description = "Template of the command executed on the public key file"
  default     = "chmod 600 %v"
}

variable "keypair_chmod_command_private" {
  type        = string
  description = "Template of the command executed on the private key file"
  default     = "chmod 400 %v"
}

#############################
# Labels
#############################

variable "labels" {
  type        = map(string)
  description = "Default labels to associate to these resources"
  default = {
    # Only lowercase keys allowed
    businessunit = "mycompany"
    team         = "devops"
    project      = "VSCode Server"
    terraform    = "true"
  }
}
