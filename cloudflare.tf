data "cloudflare_zone" "razumovsky_me_zone" {
  name = "razumovsky.me"
}

resource "cloudflare_record" "agwy_dns_dev" {
  zone_id = data.cloudflare_zone.razumovsky_me_zone.id
  name    = local.custom_cloudflare_dev_fqdn
  content = azurerm_public_ip.app_gateway_front_ip.ip_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "agwy_dns_qa" {
  zone_id = data.cloudflare_zone.razumovsky_me_zone.id
  name    = local.custom_cloudflare_qa_fqdn
  content = azurerm_public_ip.app_gateway_front_ip.ip_address
  type    = "A"
  proxied = false
}