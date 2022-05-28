locals {
  cf_zone_id = data.cloudflare_zone.cf_zone.id
}

# Get the zone ID for the given domain
data "cloudflare_zone" "cf_zone" {
  name = var.cf_domain
}

# Create the Cloudflare Access Application
resource "cloudflare_access_application" "cf_application" {
  zone_id          = local.cf_zone_id
  domain           = var.cf_domain
  name             = "VSCode Server"
  type             = "self_hosted"
  logo_url         = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/1024px-Visual_Studio_Code_1.35_icon.svg.png"
  session_duration = "24h"
}
