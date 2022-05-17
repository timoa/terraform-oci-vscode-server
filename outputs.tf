# Instance Private IP
output "instance_private_ips" {
  value = [oci_core_instance.instance.private_ip]
}

# Instance Public IP
output "instance_public_ips" {
  value = [oci_core_instance.instance.public_ip]
}
