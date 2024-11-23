locals {
  app_services = {
    dev = {
      name     = "ase-dev-${var.prefix}"
      location = "northeurope"
    }
    qa = {
      name     = "ase-qa-${var.prefix}"
      location = "northeurope"
    }
  }

  frontend_port_name             = "front-port-443"
  frontend_ip_configuration_name = "front-ip-config-${var.prefix}"
  backend_pools = [
    "backend-pool-dev",
    "backend-pool-qa"
  ]
  backend_http_settings_name = "backend-http-settings-${var.prefix}"
  http_listener_name         = "http-listener-${var.prefix}"
  ssl_certificate_name       = "agwy.test.razumovsky.me.pfx"

  routing_settings = [
    {
      environment                = "dev"
      request_routing_rule_name  = "rule-dev"
      rule_type                  = "Basic"
      http_listener_name         = "http-listener-dev"
      backend_address_pool_name  = "backend-pool-dev"
      backend_http_settings_name = "http-settings-dev"
      priority                   = 1
      host_name                  = "ase-dev-${var.prefix}.azurewebsites.net"
    },
    {
      environment                = "qa"
      request_routing_rule_name  = "rule-qa"
      rule_type                  = "Basic"
      http_listener_name         = "http-listener-qa"
      backend_address_pool_name  = "backend-pool-qa"
      backend_http_settings_name = "http-settings-qa"
      priority                   = 2
      host_name                  = "ase-qa-${var.prefix}.azurewebsites.net"
    }
  ]
}