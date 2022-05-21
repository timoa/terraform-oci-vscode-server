locals {
  security_list_ssh    = "${var.namespace}-seclist-ssh-${var.stage}"
  security_list_vscode = "${var.namespace}-seclist-vscode-${var.stage}"
}

# Security List | SSH
resource "oci_core_security_list" "security_list_ssh" {

  # Global
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = local.security_list_ssh

  # Ingress
  dynamic "ingress_security_rules" {
    for_each = var.allowed_ingress_ssh

    content {
      description = "Allow traffic only from the SSH allowed IPs"
      source      = ingress_security_rules.value
      protocol    = "6" # TCP

      tcp_options {
        min = 22 # SSH
        max = 22 # SSH
      }
    }
  }

  # Egress
  dynamic "egress_security_rules" {
    for_each = var.allowed_egress_ssh

    content {
      description = "Allow all outbound traffic from the SSH allowed IPs"
      destination = egress_security_rules.value
      protocol    = "all"
    }
  }
}

# Security List | VSCode
resource "oci_core_security_list" "security_list_vscode" {

  # Global
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = local.security_list_vscode

  # Ingress
  dynamic "ingress_security_rules" {
    for_each = var.allowed_ingress_vscode

    content {
      description = "Allow traffic only from the VSCode allowed IPs"
      source      = ingress_security_rules.value
      protocol    = "6" # TCP

      tcp_options {
        min = 443 # HTTPS
        max = 443 # HTTPS
      }
    }
  }

  # Egress
  dynamic "egress_security_rules" {
    for_each = var.allowed_egress_vscode

    content {
      description = "Allow all outbound traffic from the VSCode allowed IPs"
      destination = egress_security_rules.value
      protocol    = "all"
    }
  }
}
