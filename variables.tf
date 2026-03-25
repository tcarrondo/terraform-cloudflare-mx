variable "account_name" {
  description = "Cloudflare account name where the resources will be created"
  type        = string
}

variable "domain" {
  description = "Zone domain name"
  type        = string
}

variable "email_provider" {
  description = "E-mail service provider"
  type        = string

  validation {
    condition     = contains(keys(local.mx_records), var.email_provider)
    error_message = "The email provider must be one of the following: ${join(", ", keys(local.mx_records))}."
  }
}

variable "dont_create_spf" {
  description = "Don't we need SPF record?"
  type        = bool
  default     = false
}

variable "spf" {
  description = "Custom SPF record"
  type        = string
  default     = ""
}

variable "dont_create_dmarc" {
  description = "Don't we need DMARC record?"
  type        = bool
  default     = false
}

variable "dmarc" {
  description = "DMARC record"
  type        = string
  default     = "v=DMARC1; p=none; pct=100; rua=mailto:; ruf=mailto:; sp=none; aspf=r"
}

variable "create_dkim" {
  description = "Do we need DKIM record?"
  type        = bool
  default     = false
}

variable "dkim_selector" {
  description = "DKIM selector"
  type        = string
  default     = "google"
}

variable "dkim_value" {
  description = "DKIM value"
  type        = string
  default     = ""
}

variable "cloudflare_email_routings" {
  type = map(object({
    custom_address = string
    destination    = string
  }))
  default = {}
}
