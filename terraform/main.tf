locals {
  common_labels = merge(var.labels, {
    # Only lowercase keys allowed
    "project"     = var.namespace
    "environment" = var.stage
  })
  availability_domains = data.oci_identity_availability_domains.ads.availability_domains[*].name
  availability_domain  = reverse(local.availability_domains)[0] # Use last AD to try to avoid the "Out of Host capacity" on free tier
}

# Identity Availability Domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}
