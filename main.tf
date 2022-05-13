locals {
  common_labels = merge(var.labels, {
    # Only lowercase keys allowed
    "project"     = var.namespace
    "environment" = var.stage
  })
}