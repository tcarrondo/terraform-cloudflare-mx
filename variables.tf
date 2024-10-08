variable "domain" {
  description = "Zone domain name"
  type        = string
}

variable "email_provider" {
  description = "E-mail service provider"
  type        = string
}

variable "dont_create_spf" {
  description = "Don't we need SPF record"
  type        = bool
  default     = false
}

variable "spf" {
  description = "Custom SPF record"
  type        = string
  default     = ""
}

variable "dont_create_dmarc" {
  description = "Don't we need DMARC record"
  type        = bool
  default     = false
}

variable "dmarc" {
  description = "DMARC record"
  type        = string
  default     = "v=DMARC1; p=none; pct=100; rua=mailto:; ruf=mailto:; sp=none; aspf=r"
}
