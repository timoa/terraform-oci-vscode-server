## [0.4.1](https://github.com/timoa/terraform-oci-vscode-server/compare/v0.4.0...v0.4.1) (2022-05-17)


### Bug Fixes

* **key-pair:** add the automatic Key Pair generation ([173b469](https://github.com/timoa/terraform-oci-vscode-server/commit/173b4698f2eca04047d7df6316fb2245594f6fd2))
* **network:** fix too long DNS name (max 15 chars only) ([97a0865](https://github.com/timoa/terraform-oci-vscode-server/commit/97a08652502c191e154cc67421b5f40650ee2c00))

# [0.4.0](https://github.com/timoa/terraform-oci-vscode-server/compare/v0.3.0...v0.4.0) (2022-05-15)


### Bug Fixes

* **backups:** remove deprecated command to create volume backups ([25f0c5e](https://github.com/timoa/terraform-oci-vscode-server/commit/25f0c5e62d5e36844dafb6cab65bb6cebf4527ba))
* **network:** use freefrom_tags instead of defined_tags ([379220a](https://github.com/timoa/terraform-oci-vscode-server/commit/379220ab91fd3f364b277ce5fcf570b73caca69e))
* **provider:** add missing template provider + TFLint fixes ([c1a09b3](https://github.com/timoa/terraform-oci-vscode-server/commit/c1a09b341f4072e42804a936f06cc12eca8337c2))


### Features

* **instance:** add the instance config + cloudinit (WIP) ([9496dc0](https://github.com/timoa/terraform-oci-vscode-server/commit/9496dc0dc9fd9a94afd15ef40712c846b28be06e))

# [0.3.0](https://github.com/timoa/terraform-oci-vscode-server/compare/v0.2.0...v0.3.0) (2022-05-13)


### Bug Fixes

* **cicd:** add the missing compartment_ocid env var on the GitHub Secrets ([b236e08](https://github.com/timoa/terraform-oci-vscode-server/commit/b236e0817acc12cf0f8e6d78a1e9eed5b1a00718))


### Features

* **network:** add the creation of the network ([89ee50b](https://github.com/timoa/terraform-oci-vscode-server/commit/89ee50b8bb4ea06d282a54f9bcd9064826358bdf))

# [0.2.0](https://github.com/timoa/terraform-oci-vscode-server/compare/v0.1.0...v0.2.0) (2022-05-12)


### Features

* **project:** add the core files for Terraform ([860d90f](https://github.com/timoa/terraform-oci-vscode-server/commit/860d90f651b9f646b30c712282d059ff959f33f3))
