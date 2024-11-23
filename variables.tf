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

# variable "routing_settings" {
#   type = list(object({
#     request_routing_rule_name  = string
#     rule_type                  = string
#     http_listener_name         = string
#     backend_address_pool_name  = string
#     backend_http_settings_name = string
#     priority                   = number
#   }))
# 
#   description = "Routing rules for the Application Gateway"
#   default = [
#     {
#       request_routing_rule_name  = "rule-dev"
#       rule_type                  = "Basic"
#       http_listener_name         = "http-listener-dev"
#       backend_address_pool_name  = "backend-pool-dev"
#       backend_http_settings_name = "http-settings-dev"
#       priority                   = 1
#     },
#     {
#       request_routing_rule_name  = "rule-qa"
#       rule_type                  = "Basic"
#       http_listener_name         = "http-listener-qa"
#       backend_address_pool_name  = "backend-pool-qa"
#       backend_http_settings_name = "http-settings-qa"
#       priority                   = 2
#     }
#   ]
# }