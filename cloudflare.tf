data "cloudflare_zone" "razumovsky_me_zone" {
  name = "razumovsky.me"
}

resource "cloudflare_record" "agwy_dns" {
  zone_id = data.cloudflare_zone.razumovsky_me_zone.id
  name    = "agwy.test"
  content = azurerm_public_ip.app_gateway_front_ip.ip_address
  type    = "A"
  proxied = false
}