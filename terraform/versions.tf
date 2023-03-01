terraform {
  required_version = ">= 1.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.109.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.35.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}
