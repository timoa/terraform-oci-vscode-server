locals {
  vcn_name        = "${var.namespace}-vcn-${var.stage}"
  dns_name        = var.namespace
  igw_name        = "${var.namespace}-igw-${var.stage}"
  default_rt_name = "${var.namespace}-default-rt-${var.stage}"
  subnet_name     = "${var.namespace}-subnet-${var.stage}"
}

# Virtual Cloud Network
resource "oci_core_vcn" "vcn" {

  # Global
  compartment_id = var.compartment_ocid

  # VCN
  display_name = local.vcn_name
  dns_label    = local.dns_name
  cidr_block   = "10.1.0.0/16"

  # Labels
  freeform_tags = local.common_labels
}

# Internet Gateway
resource "oci_core_internet_gateway" "igw" {

  # Global
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  # Internet Gateway
  display_name = local.igw_name

  # Labels
  freeform_tags = local.common_labels
}

# Default Route Table
resource "oci_core_default_route_table" "default_rt" {

  # Route Table
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
  display_name               = local.default_rt_name

  # Route Rules
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }

  # Labels
  freeform_tags = local.common_labels
}

# Subnet
resource "oci_core_subnet" "subnet" {

  # Global
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  # Subnet
  display_name        = local.subnet_name
  dns_label           = local.dns_name
  availability_domain = local.availability_domain
  cidr_block          = "10.1.20.0/24"
  route_table_id      = oci_core_vcn.vcn.default_route_table_id
  dhcp_options_id     = oci_core_vcn.vcn.default_dhcp_options_id

  # Security
  security_list_ids = [
    oci_core_security_list.security_list_ssh.id,
    oci_core_security_list.security_list_vscode.id,
  ]

  # Labels
  freeform_tags = local.common_labels
}
