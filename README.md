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
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record._dmarc](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.mx](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.spf](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_zone.domain](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dmarc"></a> [dmarc](#input\_dmarc) | DMARC record | `string` | `"v=DMARC1; p=none; pct=100; rua=mailto:; ruf=mailto:; sp=none; aspf=r"` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Zone domain name | `string` | n/a | yes |
| <a name="input_dont_create_dmarc"></a> [dont\_create\_dmarc](#input\_dont\_create\_dmarc) | Don't we need DMARC record | `bool` | `false` | no |
| <a name="input_dont_create_spf"></a> [dont\_create\_spf](#input\_dont\_create\_spf) | Don't we need SPF record | `bool` | `false` | no |
| <a name="input_email_provider"></a> [email\_provider](#input\_email\_provider) | E-mail service provider | `string` | n/a | yes |
| <a name="input_spf"></a> [spf](#input\_spf) | Custom SPF record | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
