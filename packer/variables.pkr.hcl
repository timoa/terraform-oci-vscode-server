#############################
# Global
#############################

variable "namespace" {
  type    = string
  default = "vscode"
}

#############################
# Oracle Cloud Infrastructure
#############################

variable "compartment_ocid" {
  type        = string
  description = "Compartment OCID"
  default     = null # Set with PKR_VAR_compartment_ocid environment variable on ~/.zprofile or ~/.bash_profile
}

#############################
# Location
#############################

variable "region" {
  type        = string
  description = "Default Region. Needs to be the same as Terraform"
  default     = "uk-london-1"
}

variable "availability_domain" {
  type        = string
  description = "Default Availability Domain. Needs to be the same as Terraform"
}

#############################
# Network
#############################

variable "subnet_ocid" {
  type        = string
  description = "Default Availability Domain. Needs to be the same as Terraform"
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
  default     = 8
}

#############################
# Image
#############################

variable "base_image_os" {
  type        = string
  description = "Source Image OS"
  default     = "Canonical Ubuntu"
}

variable "base_image_os_version" {
  type        = string
  description = "Source Image OS Version"
  default     = "20.04"
}

variable "base_image_os_user" {
  type        = string
  description = "Source Image OS User"
  default     = "ubuntu" # opc if Oracle Linux
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

variable "businessUnit" {
  type    = string
  default = "devops"
}

variable "team" {
  type    = string
  default = "devops"
}

variable "project" {
  type    = string
  default = "VSCode Server"
}
