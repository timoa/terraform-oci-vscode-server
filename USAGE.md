<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 4.72.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_default_route_table.default_rt](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_default_route_table) | resource |
| [oci_core_instance.instance](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_instance) | resource |
| [oci_core_internet_gateway.igw](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_internet_gateway) | resource |
| [oci_core_subnet.subnet](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_subnet) | resource |
| [oci_core_vcn.vcn](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_vcn) | resource |
| [oci_core_volume.volume](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_volume) | resource |
| [oci_core_volume_attachment.volume_attach](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_volume_attachment) | resource |
| [oci_core_volume_backup_policy_assignment.policy](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_volume_backup_policy_assignment) | resource |
| [oci_core_images.ubuntu_20_04_aarch64](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/data-sources/core_images) | data source |
| [oci_core_volume_backup_policies.predefined_volume_backup_policies](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/data-sources/core_volume_backup_policies) | data source |
| [oci_identity_availability_domain.ad](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/data-sources/identity_availability_domain) | data source |
| [template_cloudinit_config.cloudinit](https://registry.terraform.io/providers/hashicorp/template/2.2.0/docs/data-sources/cloudinit_config) | data source |
| [template_file.template](https://registry.terraform.io/providers/hashicorp/template/2.2.0/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Project name that will be use to identifiy the resources | `string` | `"vscode"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage/environment name to tag and suffix the infrastructure composants | `string` | `"dev"` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | Tenancy OCID | `string` | `null` | no |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | Compartment OCID | `string` | `null` | no |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | User OCID | `string` | `null` | no |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | Fingerprint | `string` | `null` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | Private Key content | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Default Region | `string` | `"uk-london-1"` | no |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | Instance Shape | `string` | `"VM.Standard.A1.Flex"` | no |
| <a name="input_instance_ocpus"></a> [instance\_ocpus](#input\_instance\_ocpus) | Number of OCPUS (CPU cores) | `string` | `4` | no |
| <a name="input_instance_shape_config_memory_in_gbs"></a> [instance\_shape\_config\_memory\_in\_gbs](#input\_instance\_shape\_config\_memory\_in\_gbs) | Memory in GBs | `string` | `24` | no |
| <a name="input_block_volume_size"></a> [block\_volume\_size](#input\_block\_volume\_size) | Block Volume size in GBs | `string` | `150` | no |
| <a name="input_instance_os"></a> [instance\_os](#input\_instance\_os) | Instance OS | `string` | `"Canonical Ubuntu"` | no |
| <a name="input_instance_os_version"></a> [instance\_os\_version](#input\_instance\_os\_version) | Instance OS Version | `string` | `"20.04"` | no |
| <a name="input_vscode_version"></a> [vscode\_version](#input\_vscode\_version) | VS Code Server Version | `string` | `"4.4.0"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Default labels to associate to these resources | `map(string)` | <pre>{<br>  "businessunit": "mycompany",<br>  "project": "VSCode Server",<br>  "team": "devops",<br>  "terraform": "true"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
