# Azure Application Gateway

This repository demonstrates the deployment of an Azure Application Gateway using Terraform.
It includes configuration for SSL settings, backend pools with Azure App Services,
and redirection of HTTP traffic to HTTPS on behalf of Application gateway.
Additionally, Cloudflare DNS records are dynamically created using a specified Terraform provider.

## Features

- **Azure Application Gateway**:
    - Provides HTTPS connection to app services backend node pools
    - Supports routing rules to redirect HTTP (port 80) traffic to HTTPS (port 443) for improved security.

- **Cloudflare Integration**:
    - Automatically creates and manages DNS records via the Cloudflare Terraform provider,
      ensuring streamlined domain management.

## Steps to configure communication

- Deploy virtual network
- Deploy application gateway subnet
- Deploy application gateway public IP
- Associate gateway with subnet using `gateway_ip_configuration` block
- Define app gateway frontend ports (80, 443) by using `frontend_port` block
- Associate app gateway with public IP using `frontend_ip_configuration` block
- Define backend pools with app services FQDNs by using `backend_address_pool` block
- Define HTTP settings for routing rules by using `http_settings` block
- Add http and https listeners to the app gateway using `http_listener` block
- Define routing rules to handle requests based on headers CN
- Create a Cloudflare DNS record for the app gateway public IP and test connection

## Docs

- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway

## DEV

- https://agwy-dev.razumovsky.me
- http://agwy-dev.razumovsky.me

## QA

- https://agwy-qa.razumovsky.me
- http://agwy-qa.razumovsky.me