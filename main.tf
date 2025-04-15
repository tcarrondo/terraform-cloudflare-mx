# MX record(s)

resource "cloudflare_dns_record" "mx" {

  for_each = var.email_provider != "cloudflare" ? local.mx_records[var.email_provider] : {}

  zone_id  = data.cloudflare_zone.domain.zone_id
  name     = var.domain
  content  = each.value.host
  type     = "MX"
  priority = each.value.priority
  ttl      = 1
  proxied  = false
}

resource "cloudflare_dns_record" "mx_cf" {

  for_each = var.email_provider == "cloudflare" ? local.mx_records[var.email_provider] : {}

  zone_id  = data.cloudflare_zone.domain.zone_id
  name     = var.domain
  content  = each.value.host
  type     = "MX"
  priority = each.value.priority
  ttl      = 1
  proxied  = false

  lifecycle {
    ignore_changes = [
      priority # CloudFlare will manage this
    ]
  }
}

# spf, dmarc (and dkim soon)

resource "cloudflare_dns_record" "spf" {

  count = var.dont_create_spf ? 0 : 1

  zone_id = data.cloudflare_zone.domain.zone_id
  name    = var.domain
  content = var.spf != "" ? var.spf : local.spf_record[var.email_provider]
  type    = "TXT"
  ttl     = 1
  proxied = false
}

resource "cloudflare_dns_record" "_dmarc" {

  count = var.dont_create_dmarc ? 0 : 1

  zone_id = data.cloudflare_zone.domain.zone_id
  name    = "_dmarc.${var.domain}"
  content = var.dmarc
  type    = "TXT"
  ttl     = 1
  proxied = false
}

resource "cloudflare_dns_record" "dkim" {

  count = var.create_dkim ? 1 : 0

  zone_id = data.cloudflare_zone.domain.zone_id
  name    = "${var.dkim_selector}._domainkey.${var.domain}"
  content = var.dkim_value
  type    = "TXT"
  ttl     = 1
  proxied = false
}
