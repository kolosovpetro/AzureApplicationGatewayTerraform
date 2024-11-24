locals {
  app_services = {
    dev = {
      name         = local.app_service_dev_name
      location     = "northeurope"
      default_fqdn = local.app_service_dev_default_fqdn
    }
    qa = {
      name         = local.app_service_qa_name
      location     = "northeurope"
      default_fqdn = local.app_service_qa_default_fqdn
    }
  }

  app_service_dev_name         = "ase-dev-${var.prefix}"
  app_service_dev_default_fqdn = "ase-dev-${var.prefix}.azurewebsites.net"
  app_service_qa_name          = "ase-qa-${var.prefix}"
  app_service_qa_default_fqdn  = "ase-qa-${var.prefix}.azurewebsites.net"

  frontend_port_name             = "front-port-443"
  frontend_ip_configuration_name = "front-ip-config-${var.prefix}"
  backend_http_settings_name     = "backend-http-settings-${var.prefix}"
  ssl_certificate_name           = "razumovsky.me.pfx"
  domain_name                    = "razumovsky.me"
  custom_cloudflare_dev_fqdn     = "agwy-dev.${local.domain_name}"
  custom_cloudflare_qa_fqdn      = "agwy-qa.${local.domain_name}"

  routing_settings = [
    {
      environment               = "dev"
      request_routing_rule_name = "https-rule-dev"
      rule_type                 = "Basic"
      http_listener_name        = "https-listener-dev"
      backend_address_pool_name = "backend-pool-dev"
      priority                  = 10
      custom_cloudflare_fqdn    = local.custom_cloudflare_dev_fqdn
      appservice_default_fqdn   = local.app_service_dev_default_fqdn
    },
    {
      environment               = "qa"
      request_routing_rule_name = "https-rule-qa"
      rule_type                 = "Basic"
      http_listener_name        = "https-listener-qa"
      backend_address_pool_name = "backend-pool-qa"
      priority                  = 20
      custom_cloudflare_fqdn    = local.custom_cloudflare_qa_fqdn
      appservice_default_fqdn   = local.app_service_qa_default_fqdn
    }
  ]
}