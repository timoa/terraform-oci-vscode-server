# Instance Private IP
output "instance_private_ip" {
  description = "VS Code Server Instance Private IP"
  value       = [oci_core_instance.instance.private_ip]
}

# Instance Public IP
output "instance_public_ip" {
  description = "VS Code Server Instance Public IP"
  value       = [oci_core_instance.instance.public_ip]
}
