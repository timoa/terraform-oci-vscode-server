# Predefined Volume Backup Policy
data "oci_core_volume_backup_policies" "predefined_volume_backup_policies" {
  filter {
    name = "display_name"

    values = [
      "silver",
    ]
  }
}

# Backup policy
resource "oci_core_volume_backup_policy_assignment" "policy" {
  asset_id  = oci_core_instance.instance.boot_volume_id
  policy_id = data.oci_core_volume_backup_policies.predefined_volume_backup_policies.volume_backup_policies[0].id
}
