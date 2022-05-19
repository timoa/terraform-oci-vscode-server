# Deploy VSCode Server on OCI with Terraform

[![Latest Release][release-badge]][release-url]
[![Build Status][github-badge]][github-url]
[![License][license-badge]][license-url]

Terraform project that deploys VSCode Server on Oracle Cloud Infrastructure using only the free tier.

> WARNING: This project is currently under developmnent.
> Please check back later.

## TODO

- [x] Create the custom VCN (VPC)
- [x] Get the latest Ubuntu image automatically
- [x] Create the block volume for `/data` (150GB)
- [x] Attach the block volume to the instance
- [x] Create the instance on free tier (4 vCPU, 24GB memory)
- [x] Configure the instance and install VSCode Server with Cloud Init
- [x] Create automatically the SSH key pair
- [x] Mount and format the block volume on `/data`
- [x] Restrict SSH and VS Code port access
- [ ] Encrypt the block volume with a KMS key
- [ ] Configure backups of the block volume only (WIP)
- [ ] Configure Cloudflare Zero Trust to secure the instance access
- [ ] Write the documentation for the manual steps (Oracle Cloud Infrastructure & Cloudflare accounts, etc.)
- [ ] Explain how to avoid the "Out of Host capacity" error

[github-badge]: https://github.com/timoa/terraform-oci-vscode-server/workflows/Terraform/badge.svg
[github-url]: https://github.com/timoa/terraform-oci-vscode-server/actions?query=workflow%3ATerraform
[release-badge]: https://img.shields.io/github/release/timoa/terraform-oci-vscode-server.svg
[release-url]: https://github.com/timoa/terraform-oci-vscode-server/releases/latest
[license-badge]: https://img.shields.io/github/license/timoa/terraform-oci-vscode-server.svg
[license-url]: https://github.com/timoa/terraform-oci-vscode-server/blob/main/LICENSE
