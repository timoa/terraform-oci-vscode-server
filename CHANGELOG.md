# [0.7.0](https://github.com/timoa/terraform-oci-vscode-server/compare/v0.6.0...v0.7.0) (2022-05-29)


### Bug Fixes

* **ansible:** reboot only if there is kernel updates that really need a reboot ([d3296ac](https://github.com/timoa/terraform-oci-vscode-server/commit/d3296acb296bcec2fb16ebed0a10e459eb7920ab))
* **cicd:** add missing Cloudflare ENV vars ([1bd7090](https://github.com/timoa/terraform-oci-vscode-server/commit/1bd7090cf9528b67e266f5ba690ae718fa763285))
* **cicd:** add the CLoudflare API on the Harden runner allow list ([e6f4922](https://github.com/timoa/terraform-oci-vscode-server/commit/e6f492285780285bf90ef18d6a0b26315809a659))
* **cloudflare:** fix Ansible vars file when Cloudflare is not enabled ([6b2267b](https://github.com/timoa/terraform-oci-vscode-server/commit/6b2267b0e01ca4bf3d0148cbc8171cf6f70934d0))
* **cloudflare:** fix condition for zone data source ([a34b86c](https://github.com/timoa/terraform-oci-vscode-server/commit/a34b86cbfd451408834c1fcc3e73fa6a484b8396))


### Features

* **cloudflare:** add support to the Cloudflare provider ([f6b17f8](https://github.com/timoa/terraform-oci-vscode-server/commit/f6b17f8284ed21f46c955d85973dc97cd8c5329d))
* **cloudflare:** add the Cloudflare Account ID ([da14c31](https://github.com/timoa/terraform-oci-vscode-server/commit/da14c31d8277b12f6c4d9cdf4b76b56b8f6ebae4))
* **cloudflare:** create a dedicated Cloudflare Ansible playbook ([5eb5516](https://github.com/timoa/terraform-oci-vscode-server/commit/5eb5516dcf5d594cf1267f4884cb33aaeccb4e71))
* **cloudflare:** create the Cloudflare Access Tunnel ([367af1d](https://github.com/timoa/terraform-oci-vscode-server/commit/367af1d585f3169e153ff3693f802f69060339b3))
* **cloudflare:** create the Cloudflare Tunnel automatically and allow only list of users ([1251841](https://github.com/timoa/terraform-oci-vscode-server/commit/12518412147432bb40a1b91d0198e119895aecd2))
* **cloudflare:** get the Zone ID + create the Cloudflare Access Application ([1a0fe4b](https://github.com/timoa/terraform-oci-vscode-server/commit/1a0fe4bbced9e43d6608fbb3ae8424165bdca14f))
* **cloudflare:** install the Cloudflare agent (cloudflared) with Ansible ([716b194](https://github.com/timoa/terraform-oci-vscode-server/commit/716b194eff38c708cf128a8f192232edcd63d3b1))
* **cloudflare:** make Cloudflare Zero Trust optional ([62316ac](https://github.com/timoa/terraform-oci-vscode-server/commit/62316ac252b675cbf91bdd3381e3c6d821c84797))
* **vscode:** deactivate password since using SSH tunnel or Cloudflare Zero Trust ([c41c99e](https://github.com/timoa/terraform-oci-vscode-server/commit/c41c99e2ce0ab4b1c1357fd4086437eb62cade6d))

# [0.6.0](https://github.com/timoa/terraform-oci-vscode-server/compare/v0.5.1...v0.6.0) (2022-05-27)


### Bug Fixes

* **ansible:** provides system information to the playbooks ([e1e4e0e](https://github.com/timoa/terraform-oci-vscode-server/commit/e1e4e0e9d309c5138c1353a18719c6fca384a71d))
* **ansible:** use Ansible command to check if the block volume is formated or not ([a88c58a](https://github.com/timoa/terraform-oci-vscode-server/commit/a88c58acd30304a1f18a2c5811c34f4b4384501b))
* **cloudinit:** update the path to the template + cleanup (WIP) ([a1bd7ff](https://github.com/timoa/terraform-oci-vscode-server/commit/a1bd7ffc009f15a9987d17004354280ca929291c))
* **install:** trigger te local exec scripts when the instance is replaced ([61a928b](https://github.com/timoa/terraform-oci-vscode-server/commit/61a928b05ab20003e13e60dcb1ef14f2d5c278db))
* **project:** fix previous messy commit ([1818695](https://github.com/timoa/terraform-oci-vscode-server/commit/1818695df13bb2fada564ed39f4736826960abe7))


### Features

* **ansible:** ad the playbooks for mounting the /data volume + VSCode Server install ([5119802](https://github.com/timoa/terraform-oci-vscode-server/commit/5119802dd2b165a507cd628b39416d05a3b69841))
* **ansible:** add common + devops deps (if enabled) with Ansible ([4598921](https://github.com/timoa/terraform-oci-vscode-server/commit/4598921e6e22881bb32cf0603398e0aef1124da6))
* **install:** create the Ansible hosts and vars files from the Terraform state ([bbde721](https://github.com/timoa/terraform-oci-vscode-server/commit/bbde7211d2041b6f2d8936177c344ff428f737b7))
* **install:** execute the Ansible Playbooks for mounting /data + VS Code Server install ([6dc2e69](https://github.com/timoa/terraform-oci-vscode-server/commit/6dc2e697840f2c6420784898906339b892c56fe2))

## [0.5.1](https://github.com/timoa/terraform-oci-vscode-server/compare/v0.5.0...v0.5.1) (2022-05-21)


### Bug Fixes

* **lint:** TFLint fixes ([42197fc](https://github.com/timoa/terraform-oci-vscode-server/commit/42197fcb4c522d82f9766d64b48e3b8314fac7ef))

# [0.5.0](https://github.com/timoa/terraform-oci-vscode-server/compare/v0.4.1...v0.5.0) (2022-05-19)


### Bug Fixes

* **ad:** use dynamic AD attribution to avoid the "Out of Host capacity" error on the free tier ([254c3b0](https://github.com/timoa/terraform-oci-vscode-server/commit/254c3b0e6d11eb045a64018db441c140a7b0423f))
* **cloudinit:** remove the deprecated template provider ([8955dc7](https://github.com/timoa/terraform-oci-vscode-server/commit/8955dc7db4677dcbc3a3f3914210880b2133a910))
* **instance:** trigger the mount script on volume attachment changes ([55e5369](https://github.com/timoa/terraform-oci-vscode-server/commit/55e536923776e4d7d86c4f63f1b8f5a6343990d8))
* **network:** remove unused variable ([35208a4](https://github.com/timoa/terraform-oci-vscode-server/commit/35208a49aae25bf9efb127628a4fbb4ab3989dce))


### Features

* **firewall:** add a security list for SSH and VScode ([14cf9a4](https://github.com/timoa/terraform-oci-vscode-server/commit/14cf9a4aee110da4e67a83d06c85755a20c910bb))

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
