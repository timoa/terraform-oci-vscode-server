terraform {
  required_version = ">= 1.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.76.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.15.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.1"
    }
  }
}
