<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 4.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_default_route_table.default_rt](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_default_route_table) | resource |
| [oci_core_internet_gateway.igw](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_internet_gateway) | resource |
| [oci_core_subnet.subnet](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_subnet) | resource |
| [oci_core_vcn.vcn](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_vcn) | resource |
| [oci_identity_availability_domain.ad](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/data-sources/identity_availability_domain) | data source |

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
| <a name="input_labels"></a> [labels](#input\_labels) | Default labels to associate to these resources | `map(string)` | <pre>{<br>  "businessunit": "mycompany",<br>  "project": "VSCode Server",<br>  "team": "devops",<br>  "terraform": "true"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->