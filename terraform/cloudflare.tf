locals {
  cf_zone_id     = var.cf_zero_trust_enabled ? data.cloudflare_zone.cf_zone[0].id : ""
  cf_cname       = "${var.cf_subdomain}.${var.cf_domain}"
  cf_tunnel_name = "${var.namespace}-tunnel-${var.stage}"
  cf_argo_secret = var.cf_zero_trust_enabled ? random_id.argo_secret[0].b64_std : ""
}

# Get the zone ID for the given domain
data "cloudflare_zone" "cf_zone" {

  count = var.cf_zero_trust_enabled ? 1 : 0

  name = var.cf_domain
}

#############################
# Cloudflare Access Tunnel
#############################

# Create a secret for the Cloudflare Argo Tunnel
resource "random_id" "argo_secret" {

  count = var.cf_zero_trust_enabled ? 1 : 0

  byte_length = 35
}

# Create the Cloudflare Argo Tunnel for Cloudflare Access
resource "cloudflare_argo_tunnel" "cf_tunnel" {

  count = var.cf_zero_trust_enabled ? 1 : 0

  account_id = var.cf_account_id
  name       = local.cf_tunnel_name
  secret     = local.cf_argo_secret
}

# Create the Cloudfflare Argo Tunnel Route
resource "cloudflare_tunnel_route" "cf_tunnel_route" {

  count = var.cf_zero_trust_enabled ? 1 : 0

  account_id = var.cf_account_id
  tunnel_id  = cloudflare_argo_tunnel.cf_tunnel[0].id
  network    = "${oci_core_instance.instance.private_ip}/32"
  comment    = "Tunnel Route for VSCode Server"
}

# Create the Cloudflare DNS Record for the Cloudflare Argo Tunnel
resource "cloudflare_record" "cf_tunnel_cname" {

  count = var.cf_zero_trust_enabled ? 1 : 0

  zone_id = local.cf_zone_id
  name    = var.cf_subdomain
  value   = "${cloudflare_argo_tunnel.cf_tunnel[0].id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
}

#############################
# Cloudflare Access App
#############################

# Create the Cloudflare Access Application
resource "cloudflare_access_application" "cf_application" {

  count = var.cf_zero_trust_enabled ? 1 : 0

  zone_id          = local.cf_zone_id
  domain           = local.cf_cname
  name             = "VSCode Server"
  type             = "self_hosted"
  logo_url         = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/1024px-Visual_Studio_Code_1.35_icon.svg.png"
  session_duration = "24h"
}

# Create the Cloudflare Access Application Allow Policy
resource "cloudflare_access_policy" "cf_allow_policy" {

  count = var.cf_zero_trust_enabled ? 1 : 0
  # count = length(var.cf_allowed_users) != 0 ? 1 : 0

  application_id = cloudflare_access_application.cf_application[0].id
  zone_id        = local.cf_zone_id
  name           = "Allow Policy"
  precedence     = "1"
  decision       = "allow"

  include {
    email = var.cf_allowed_users
  }
}
