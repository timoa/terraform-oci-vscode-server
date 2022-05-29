# Deploy VSCode Server on OCI with Terraform

[![Latest Release][release-badge]][release-url]
[![Build Status][github-badge]][github-url]
[![License][license-badge]][license-url]

Terraform project that deploys VSCode Server on Oracle Cloud Infrastructure using only the free tier.

> WARNING: This project is currently under active development.
> Please check back later.

## The challenge

### Goal

Deploy a free and easy maintenable VSCode Server.

### Limitations

Currently, Oracle Cloud Free tier provides great performance (4vCPU ARM based, 24GB of RAM, and 200GB of storage), but:

- The instance is preemptible, which means that they can be terminated at any time
- We can't create custom images, so we have to install VSCode Server and other dependencies at boot time
- Can be hard to find a OCI datacenter that has still available capacity

## How to start

### Create an OCI account

### Configure the OCI authentication

### Deploy the VSCode Server instance

### Access to VSCode Server from your browser

## TODO

- [x] Create the custom VCN (VPC)
- [x] Get the latest Ubuntu image automatically
- [x] Create the block volume for `/data` (100GB)
- [x] Attach the block volume to the instance
- [x] Create the instance on free tier (4 vCPU, 24GB memory)
- [x] Configure the instance and install VSCode Server with Cloud Init
- [x] Create automatically the SSH key pair
- [x] Mount and format the block volume on `/data`
- [x] Restrict SSH and VS Code port access
- [x] Configure backups of the block volume only
- [x] Configure Cloudflare Access (ZeroTrust) to secure the instance access
- [ ] Encrypt the block volume with a KMS key
- [ ] Write the documentation for the manual steps (Oracle Cloud Infrastructure & Cloudflare accounts, etc.)
- [ ] Explain how to avoid the "Out of Host capacity" error

[github-badge]: https://github.com/timoa/terraform-oci-vscode-server/workflows/Terraform/badge.svg
[github-url]: https://github.com/timoa/terraform-oci-vscode-server/actions?query=workflow%3ATerraform
[release-badge]: https://img.shields.io/github/release/timoa/terraform-oci-vscode-server.svg
[release-url]: https://github.com/timoa/terraform-oci-vscode-server/releases/latest
[license-badge]: https://img.shields.io/github/license/timoa/terraform-oci-vscode-server.svg
[license-url]: https://github.com/timoa/terraform-oci-vscode-server/blob/main/LICENSE
