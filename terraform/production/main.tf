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


resource "cloudflare_record" "prod_api" {
  zone_id = var.cloudflare_zone_id
  name    = "api"
  type    = "CNAME"
  content   = "go-api-prod.fly.dev"
  ttl     = 120
  proxied = false
  allow_overwrite = true
}
