output "dev_urls" {
  value = {
    ip         = azurerm_public_ip.app_gateway_front_ip.ip_address
    fqdn       = local.app_services.dev.custom_cloudflare_fqdn
    https_link = "https://${local.app_services.dev.custom_cloudflare_fqdn}"
    http_link  = "http://${local.app_services.dev.custom_cloudflare_fqdn}"
  }
}

output "qa_urls" {
  value = {
    ip         = azurerm_public_ip.app_gateway_front_ip.ip_address
    fqdn       = local.app_services.qa.custom_cloudflare_fqdn
    https_link = "https://${local.app_services.qa.custom_cloudflare_fqdn}"
    http_link  = "http://${local.app_services.qa.custom_cloudflare_fqdn}"
  }
}

output "gateway_frontend_ip" {
  value = azurerm_public_ip.app_gateway_front_ip.ip_address
}
