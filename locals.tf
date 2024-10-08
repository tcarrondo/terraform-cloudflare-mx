locals {
  mx_records = {
    google = {
      aspmx = {
        priority = "1"
        host     = "aspmx.l.google.com"
      },
      alt1 = {
        priority = "5"
        host     = "alt1.aspmx.l.google.com"
      },
      alt2 = {
        priority = "5"
        host     = "alt2.aspmx.l.google.com"
      },
      alt3 = {
        priority = "10"
        host     = "alt3.aspmx.l.google.com"
      },
      alt4 = {
        priority = "10"
        host     = "alt4.aspmx.l.google.com"
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
  }

  spf_record = {
    google = "v=spf1 a mx include:_spf.google.com ~all"
    ovh    = "v=spf1 a mx include:mx.ovh.com ~all"
  }
}
