output "application_gateway_public_ip" {
  value = {
    ip         = azurerm_public_ip.app_gateway_front_ip.ip_address
    sub_domain = "agwy.test"
    fqdn       = "https://agwy.test.razumovsky.me"
  }
}