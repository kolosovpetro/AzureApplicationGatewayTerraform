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
  backend_http_settings_name     = "backend-http-settings-${var.prefix}"
  http_listener_name             = "http-listener-${var.prefix}"
  ssl_certificate_name           = "agwy.test.razumovsky.me.pfx"
  domain_name                    = "razumovsky.me"
  dev_dns                        = "agwy.dev.${local.domain_name}"
  qa_dns                         = "agwy.qa.${local.domain_name}"

  routing_settings = [
    {
      environment                = "dev"
      request_routing_rule_name  = "rule-dev"
      rule_type                  = "Basic"
      http_listener_name         = "https-listener-dev"
      backend_address_pool_name  = "backend-pool-dev"
      backend_http_settings_name = "http-settings-dev"
      priority                   = 10
      host_name                  = local.dev_dns
      default_host_name          = "ase-dev-${var.prefix}.azurewebsites.net"
    },
    {
      environment                = "qa"
      request_routing_rule_name  = "rule-qa"
      rule_type                  = "Basic"
      http_listener_name         = "https-listener-qa"
      backend_address_pool_name  = "backend-pool-qa"
      backend_http_settings_name = "http-settings-qa"
      priority                   = 20
      host_name                  = local.qa_dns
      default_host_name          = "ase-qa-${var.prefix}.azurewebsites.net"
    }
  ]
}