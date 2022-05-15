locals {
  common_labels = merge(var.labels, {
    # Only lowercase keys allowed
    "project"     = var.namespace
    "environment" = var.stage
  })
}

# Identity Availability Domain
data "oci_identity_availability_domain" "ad" {
  compartment_id = var.compartment_ocid
  ad_number      = 1
}