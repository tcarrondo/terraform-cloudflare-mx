resource "cloudflare_email_routing_settings" "this" {
  count   = var.email_provider == "cloudflare" ? 1 : 0
  zone_id = data.cloudflare_zone.domain.id
  enabled = true
}

resource "cloudflare_email_routing_rule" "this" {

  for_each = var.cloudflare_email_routings

  zone_id = data.cloudflare_zone.domain.id
  name    = each.key
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = each.value.custom_address
  }

  action {
    type  = "forward"
    value = [each.value.destination]
  }
}
