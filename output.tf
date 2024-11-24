output "dev_urls" {
  value = {
    ip         = azurerm_public_ip.app_gateway_front_ip.ip_address
    fqdn       = local.custom_cloudflare_dev_fqdn
    https_link = "https://${local.custom_cloudflare_dev_fqdn}"
    http_link  = "http://${local.custom_cloudflare_dev_fqdn}"
  }
}

output "qa_urls" {
  value = {
    ip         = azurerm_public_ip.app_gateway_front_ip.ip_address
    fqdn       = local.custom_cloudflare_qa_fqdn
    https_link = "https://${local.custom_cloudflare_qa_fqdn}"
    http_link  = "http://${local.custom_cloudflare_qa_fqdn}"
  }
}