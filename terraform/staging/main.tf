terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}


resource "cloudflare_record" "staging_api" {
  zone_id = var.cloudflare_zone_id
  name    = "api.staging"
  type    = "CNAME"
  content   = "go-api-staging.fly.dev"
  ttl     = 120
  proxied = true
  allow_overwrite = true
}
