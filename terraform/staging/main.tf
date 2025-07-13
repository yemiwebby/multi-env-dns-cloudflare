provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_record" "staging_api" {
  zone_id = var.cloudflare_zone_id
  name    = "api.staging"
  type    = "CNAME"
  value   = "go-api-staging.fly.dev"
  ttl     = 120
  proxied = false
}
