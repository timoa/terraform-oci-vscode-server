<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.2.2 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.1.1 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 4.72.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.private_key_pem](https://registry.terraform.io/providers/hashicorp/local/2.2.2/docs/resources/file) | resource |
| [local_file.public_key_openssh](https://registry.terraform.io/providers/hashicorp/local/2.2.2/docs/resources/file) | resource |
| [null_resource.private_key_chmod](https://registry.terraform.io/providers/hashicorp/null/3.1.1/docs/resources/resource) | resource |
| [null_resource.public_key_chmod](https://registry.terraform.io/providers/hashicorp/null/3.1.1/docs/resources/resource) | resource |
| [null_resource.remote_exec](https://registry.terraform.io/providers/hashicorp/null/3.1.1/docs/resources/resource) | resource |
| [oci_core_default_route_table.default_rt](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_default_route_table) | resource |
| [oci_core_instance.instance](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_instance) | resource |
| [oci_core_internet_gateway.igw](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_internet_gateway) | resource |
| [oci_core_subnet.subnet](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_subnet) | resource |
| [oci_core_vcn.vcn](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_vcn) | resource |
| [oci_core_volume.volume](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_volume) | resource |
| [oci_core_volume_attachment.volume_attachment](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_volume_attachment) | resource |
| [oci_core_volume_backup_policy_assignment.policy](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_volume_backup_policy_assignment) | resource |
| [tls_private_key.default](https://registry.terraform.io/providers/hashicorp/tls/3.4.0/docs/resources/private_key) | resource |
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
| <a name="input_block_volume_size"></a> [block\_volume\_size](#input\_block\_volume\_size) | Block Volume size in GBs (/data) | `string` | `100` | no |
| <a name="input_block_volume_device_name"></a> [block\_volume\_device\_name](#input\_block\_volume\_device\_name) | Block Volume device name (/dev/oracleoci/oraclevdb) | `string` | `"/dev/oracleoci/oraclevdb"` | no |
| <a name="input_instance_os"></a> [instance\_os](#input\_instance\_os) | Instance OS | `string` | `"Canonical Ubuntu"` | no |
| <a name="input_instance_os_version"></a> [instance\_os\_version](#input\_instance\_os\_version) | Instance OS Version | `string` | `"20.04"` | no |
| <a name="input_instance_os_user"></a> [instance\_os\_user](#input\_instance\_os\_user) | Instance User | `string` | `"ubuntu"` | no |
| <a name="input_vscode_version"></a> [vscode\_version](#input\_vscode\_version) | VS Code Server Version | `string` | `"4.4.0"` | no |
| <a name="input_keypair_name"></a> [keypair\_name](#input\_keypair\_name) | Name of the Key Pair (instance or service for ex.) | `string` | `null` | no |
| <a name="input_keypair_public_key"></a> [keypair\_public\_key](#input\_keypair\_public\_key) | A pregenerated OpenSSH-formatted public key. Changing this creates a new keypair. If a public key is not specified, then a public/private key pair will be automatically generated. If a pair is created, then destroying this resource means you will lose access to that keypair forever. | `string` | `null` | no |
| <a name="input_keypair_public_key_path"></a> [keypair\_public\_key\_path](#input\_keypair\_public\_key\_path) | Path to Public Key directory (e.g. `/keypairs`) | `string` | `"./keypairs"` | no |
| <a name="input_keypair_key_algorithm"></a> [keypair\_key\_algorithm](#input\_keypair\_key\_algorithm) | Key Pair algorithm | `string` | `"RSA"` | no |
| <a name="input_keypair_private_key"></a> [keypair\_private\_key](#input\_keypair\_private\_key) | A pregenerated OpenSSH-formatted private key. Changing this creates a new keypair. If a private key is not specified, then a public/private key pair will be automatically generated. If a pair is created, then destroying this resource means you will lose access to that keypair forever. | `string` | `null` | no |
| <a name="input_keypair_private_key_extension"></a> [keypair\_private\_key\_extension](#input\_keypair\_private\_key\_extension) | Private key extension | `string` | `""` | no |
| <a name="input_keypair_public_key_extension"></a> [keypair\_public\_key\_extension](#input\_keypair\_public\_key\_extension) | Public key extension | `string` | `".pub"` | no |
| <a name="input_keypair_chmod_command_public"></a> [keypair\_chmod\_command\_public](#input\_keypair\_chmod\_command\_public) | Template of the command executed on the public key file | `string` | `"chmod 600 %v"` | no |
| <a name="input_keypair_chmod_command_private"></a> [keypair\_chmod\_command\_private](#input\_keypair\_chmod\_command\_private) | Template of the command executed on the private key file | `string` | `"chmod 400 %v"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Default labels to associate to these resources | `map(string)` | <pre>{<br>  "businessunit": "mycompany",<br>  "project": "VSCode Server",<br>  "team": "devops",<br>  "terraform": "true"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_private_ips"></a> [instance\_private\_ips](#output\_instance\_private\_ips) | Instance Private IP |
| <a name="output_instance_public_ips"></a> [instance\_public\_ips](#output\_instance\_public\_ips) | Instance Public IP |
<!-- END_TF_DOCS -->
