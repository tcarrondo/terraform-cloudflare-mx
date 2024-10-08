# cloudflare-mx
A Terraform module to configure mail configuration of a domain on a Cloudflare DNS zone the simpleway.
It supports the current mail providers:
* Google;
* OVH;
* ~~Cloudflare~~;
* ~~Mailcow (Not a provider, but I need it)~~.

## Usage
```hcl
provider "cloudflare" {
  email   = ""
  api_key = ""
  version = "~> 4"
}

module "mx_domain_com" {
  source  = "tcarrondo/mx/cloudflare"
  version = "~> 1"

  domain         = "domain.com"
  email_provider = "google"
}
```

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->
