resource "cloudflare_email_routing_settings" "this" {
  count   = var.email_provider == "cloudflare" ? 1 : 0
  zone_id = data.cloudflare_zone.domain.zone_id
}

resource "cloudflare_email_routing_rule" "this" {

  for_each = var.cloudflare_email_routings

  zone_id = data.cloudflare_zone.domain.zone_id
  name    = each.key
  enabled = true

  matchers = [{
    type  = "literal"
    field = "to"
    value = each.value.custom_address
  }]

  actions = [{
    type  = "forward"
    value = [each.value.destination]
  }]
}
