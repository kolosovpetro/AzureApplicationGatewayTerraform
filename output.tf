output "dev_urls" {
  value = {
    ip         = azurerm_public_ip.app_gateway_front_ip.ip_address
    fqdn       = local.dev_dns
  }
}

output "qa_urls" {
  value = {
    ip         = azurerm_public_ip.app_gateway_front_ip.ip_address
    fqdn       = local.qa_dns
  }
}