locals {
  mx_records = {
    google = {
      mx = {
        priority = "1"
        host     = "smtp.google.com"
      }
    }
    ovh = {
      mx0 = {
        priority = "1"
        host     = "mx0.mail.ovh.net"
      },
      mx1 = {
        priority = "5"
        host     = "mx1.mail.ovh.net"
      },
      mx2 = {
        priority = "50"
        host     = "mx2.mail.ovh.net"
      },
      mx3 = {
        priority = "100"
        host     = "mx3.mail.ovh.net"
      },
      mx4 = {
        priority = "200"
        host     = "mx4.mail.ovh.net"
      }
    }
    cloudflare = {
      route1 = {
        priority = "66" # CloudFlare will manage this
        host     = "route1.mx.cloudflare.net"
      },
      route2 = {
        priority = "66" # CloudFlare will manage this
        host     = "route2.mx.cloudflare.net"
      },
      route3 = {
        priority = "66" # CloudFlare will manage this
        host     = "route3.mx.cloudflare.net"
      }
    }
  }

  spf_record = {
    google     = "v=spf1 a mx include:_spf.google.com ~all"
    ovh        = "v=spf1 a mx include:mx.ovh.com ~all"
    cloudflare = "\"v=spf1 a mx include:_spf.mx.cloudflare.net ~all\""
  }
}
