# MX record(s)

resource "cloudflare_record" "mx" {

  for_each = local.mx_records[var.email_provider]

  zone_id  = data.cloudflare_zone.domain.id
  name     = var.domain
  content  = each.value.host
  type     = "MX"
  priority = each.value.priority
  ttl      = 1
  proxied  = false
}

# spf, dmarc (and dkim soon)

resource "cloudflare_record" "spf" {

  count = var.dont_create_spf ? 0 : 1

  zone_id = data.cloudflare_zone.domain.id
  name    = var.domain
  content = var.spf != "" ? var.spf : local.spf_record[var.email_provider]
  type    = "TXT"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "_dmarc" {

  count = var.dont_create_dmarc ? 0 : 1

  zone_id = data.cloudflare_zone.domain.id
  name    = "_dmarc"
  content = var.dmarc
  type    = "TXT"
  ttl     = 1
  proxied = false
}
