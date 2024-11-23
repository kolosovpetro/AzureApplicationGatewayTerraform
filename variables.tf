variable "prefix" {
  type        = string
  description = "Prefix for all resources"
}

variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "ssl_certificate_password" {
  type        = string
  description = "Password for the SSL certificate"
}