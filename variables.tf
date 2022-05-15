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
# Oracle Cloud Infrastrcture
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
  default = 4
}

variable "instance_shape_config_memory_in_gbs" {
  type        = string
  description = "Memory in GBs"
  default = 24
}

variable "block_volume_size" {
  type       = string
  description = "Block Volume size in GBs"
  default = 150
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

#############################
# VS Code Server
#############################

variable "vscode_version" {
  type        = string
  description = "VS Code Server Version"
  default     = "4.4.0"
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
