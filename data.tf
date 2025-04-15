data "cloudflare_zone" "domain" {
  filter = {
    name = var.domain
  }
}
