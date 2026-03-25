data "cloudflare_zone" "domain" {
  filter = {
    account = {
      name = var.account_name
    }
    name = var.domain
  }
}
