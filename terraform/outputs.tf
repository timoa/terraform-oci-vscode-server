# Availabiltiy Domain
output "availability_domain" {
  description = "Availability Domain where the instance as been created"
  value       = local.availability_domain
}

# Subnet
output "subnet_id" {
  description = "Subnet ID where the instance as been created"
  value       = oci_core_subnet.subnet.id
}

# Instance Private IP
output "instance_private_ip" {
  description = "VS Code Server Instance Private IP"
  value       = [oci_core_instance.instance[*].private_ip]
}

# Instance Public IP
output "instance_public_ip" {
  description = "VS Code Server Instance Public IP"
  value       = [oci_core_instance.instance[*].public_ip]
}
