#############################
# Global
#############################

variable "namespace" {
  type        = string
  description = "Project name that will be use to identifiy the resources"
  default     = "my-project"
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
