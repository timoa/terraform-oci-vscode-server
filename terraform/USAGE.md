<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 3.15.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | 2.2.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.2.3 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.1.1 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 4.72.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_access_application.cf_application](https://registry.terraform.io/providers/cloudflare/cloudflare/3.15.0/docs/resources/access_application) | resource |
| [cloudflare_access_policy.cf_allow_policy](https://registry.terraform.io/providers/cloudflare/cloudflare/3.15.0/docs/resources/access_policy) | resource |
| [cloudflare_argo_tunnel.cf_tunnel](https://registry.terraform.io/providers/cloudflare/cloudflare/3.15.0/docs/resources/argo_tunnel) | resource |
| [cloudflare_record.cf_tunnel_cname](https://registry.terraform.io/providers/cloudflare/cloudflare/3.15.0/docs/resources/record) | resource |
| [cloudflare_tunnel_route.cf_tunnel_route](https://registry.terraform.io/providers/cloudflare/cloudflare/3.15.0/docs/resources/tunnel_route) | resource |
| [local_file.ansible_hosts](https://registry.terraform.io/providers/hashicorp/local/2.2.3/docs/resources/file) | resource |
| [local_file.ansible_variables](https://registry.terraform.io/providers/hashicorp/local/2.2.3/docs/resources/file) | resource |
| [local_file.private_key_pem](https://registry.terraform.io/providers/hashicorp/local/2.2.3/docs/resources/file) | resource |
| [local_file.public_key_openssh](https://registry.terraform.io/providers/hashicorp/local/2.2.3/docs/resources/file) | resource |
| [null_resource.cloudflare_playbook](https://registry.terraform.io/providers/hashicorp/null/3.1.1/docs/resources/resource) | resource |
| [null_resource.common_playbook](https://registry.terraform.io/providers/hashicorp/null/3.1.1/docs/resources/resource) | resource |
| [null_resource.devops_roles](https://registry.terraform.io/providers/hashicorp/null/3.1.1/docs/resources/resource) | resource |
| [null_resource.mount_data_volume](https://registry.terraform.io/providers/hashicorp/null/3.1.1/docs/resources/resource) | resource |
| [null_resource.private_key_chmod](https://registry.terraform.io/providers/hashicorp/null/3.1.1/docs/resources/resource) | resource |
| [null_resource.public_key_chmod](https://registry.terraform.io/providers/hashicorp/null/3.1.1/docs/resources/resource) | resource |
| [oci_core_default_route_table.default_rt](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_default_route_table) | resource |
| [oci_core_instance.instance](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_instance) | resource |
| [oci_core_internet_gateway.igw](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_internet_gateway) | resource |
| [oci_core_security_list.security_list_ssh](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_security_list) | resource |
| [oci_core_security_list.security_list_vscode](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_security_list) | resource |
| [oci_core_subnet.subnet](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_subnet) | resource |
| [oci_core_vcn.vcn](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_vcn) | resource |
| [oci_core_volume.volume](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_volume) | resource |
| [oci_core_volume_attachment.volume_attachment](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_volume_attachment) | resource |
| [oci_core_volume_backup_policy_assignment.policy](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/resources/core_volume_backup_policy_assignment) | resource |
| [random_id.argo_secret](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [tls_private_key.default](https://registry.terraform.io/providers/hashicorp/tls/3.4.0/docs/resources/private_key) | resource |
| [cloudflare_zone.cf_zone](https://registry.terraform.io/providers/cloudflare/cloudflare/3.15.0/docs/data-sources/zone) | data source |
| [cloudinit_config.cloudinit](https://registry.terraform.io/providers/hashicorp/cloudinit/2.2.0/docs/data-sources/config) | data source |
| [oci_core_images.ubuntu_20_04_aarch64](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/data-sources/core_images) | data source |
| [oci_core_volume_backup_policies.predefined_volume_backup_policies](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/data-sources/core_volume_backup_policies) | data source |
| [oci_identity_availability_domains.ads](https://registry.terraform.io/providers/oracle/oci/4.72.0/docs/data-sources/identity_availability_domains) | data source |

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
| <a name="input_cf_zero_trust_enabled"></a> [cf\_zero\_trust\_enabled](#input\_cf\_zero\_trust\_enabled) | Register VSCode with Cloudflare Zero Trust | `bool` | `false` | no |
| <a name="input_cf_account_id"></a> [cf\_account\_id](#input\_cf\_account\_id) | Set by TF\_VAR\_cf\_account\_id environment variable on ~/.zprofile or ~/.bash\_profile | `string` | `null` | no |
| <a name="input_cf_domain"></a> [cf\_domain](#input\_cf\_domain) | Domain Name for Cloudflare Zero Trust | `string` | `"example.com"` | no |
| <a name="input_cf_subdomain"></a> [cf\_subdomain](#input\_cf\_subdomain) | Subdomain Name for Cloudflare Zero Trust | `string` | `"vscode"` | no |
| <a name="input_cf_allowed_users"></a> [cf\_allowed\_users](#input\_cf\_allowed\_users) | Users (emails) allowed to access the VSCode Server application | `list(string)` | `[]` | no |
| <a name="input_allowed_ingress_ssh"></a> [allowed\_ingress\_ssh](#input\_allowed\_ingress\_ssh) | List of IPs allowed to SSH on the instance | `list(string)` | `[]` | no |
| <a name="input_allowed_egress_ssh"></a> [allowed\_egress\_ssh](#input\_allowed\_egress\_ssh) | List of IPs the instance is allowed to connect | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_allowed_ingress_vscode"></a> [allowed\_ingress\_vscode](#input\_allowed\_ingress\_vscode) | List of IPs allowed to access to VS Code Server | `list(string)` | `[]` | no |
| <a name="input_allowed_egress_vscode"></a> [allowed\_egress\_vscode](#input\_allowed\_egress\_vscode) | List of IPs the instance is allowed to connect | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | Instance Shape | `string` | `"VM.Standard.A1.Flex"` | no |
| <a name="input_instance_ocpus"></a> [instance\_ocpus](#input\_instance\_ocpus) | Number of OCPUS (CPU cores) | `string` | `4` | no |
| <a name="input_instance_shape_config_memory_in_gbs"></a> [instance\_shape\_config\_memory\_in\_gbs](#input\_instance\_shape\_config\_memory\_in\_gbs) | Memory in GBs | `string` | `24` | no |
| <a name="input_instance_os"></a> [instance\_os](#input\_instance\_os) | Instance OS | `string` | `"Canonical Ubuntu"` | no |
| <a name="input_instance_os_version"></a> [instance\_os\_version](#input\_instance\_os\_version) | Instance OS Version | `string` | `"20.04"` | no |
| <a name="input_instance_os_user"></a> [instance\_os\_user](#input\_instance\_os\_user) | Instance User | `string` | `"ubuntu"` | no |
| <a name="input_block_volume_size"></a> [block\_volume\_size](#input\_block\_volume\_size) | Block Volume size in GBs (/data) | `string` | `100` | no |
| <a name="input_block_volume_device_name"></a> [block\_volume\_device\_name](#input\_block\_volume\_device\_name) | Block Volume device name (/dev/oracleoci/oraclevdb) | `string` | `"/dev/oracleoci/oraclevdb"` | no |
| <a name="input_vscode_version"></a> [vscode\_version](#input\_vscode\_version) | VS Code Server Version | `string` | `"4.4.0"` | no |
| <a name="input_install_devops_deps"></a> [install\_devops\_deps](#input\_install\_devops\_deps) | Install DevOps tools like Docker, Helm, Terraform, Ansible, etc. | `bool` | `false` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Terraform Version | `string` | `"1.2.1"` | no |
| <a name="input_tfdocs_version"></a> [tfdocs\_version](#input\_tfdocs\_version) | Terraform Docs Version | `string` | `"0.16.0"` | no |
| <a name="input_tfsec_version"></a> [tfsec\_version](#input\_tfsec\_version) | TFSec Version | `string` | `"1.21.2"` | no |
| <a name="input_tflint_version"></a> [tflint\_version](#input\_tflint\_version) | TFLint Version | `string` | `"0.37.0"` | no |
| <a name="input_packer_version"></a> [packer\_version](#input\_packer\_version) | Packer Version | `string` | `"1.8.1"` | no |
| <a name="input_helm_version"></a> [helm\_version](#input\_helm\_version) | Helm Version | `string` | `"3.9.0"` | no |
| <a name="input_kubectl_version"></a> [kubectl\_version](#input\_kubectl\_version) | Kubectl Version | `string` | `"1.24.0"` | no |
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
| <a name="output_instance_private_ip"></a> [instance\_private\_ip](#output\_instance\_private\_ip) | VS Code Server Instance Private IP |
| <a name="output_instance_public_ip"></a> [instance\_public\_ip](#output\_instance\_public\_ip) | VS Code Server Instance Public IP |
<!-- END_TF_DOCS -->