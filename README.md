# Azure Application Gateway

This repository demonstrates the deployment of an Azure Application Gateway using Terraform.
It includes configuration for SSL settings, backend pools with Azure App Services,
and redirection of HTTP traffic to HTTPS on behalf of Application gateway.
Additionally, Cloudflare DNS records are dynamically created using a specified Terraform provider.

## DEV

- https://agwy-dev.razumovsky.me
- http://agwy-dev.razumovsky.me

## QA

- https://agwy-qa.razumovsky.me
- http://agwy-qa.razumovsky.me

## Docs

- https://learn.microsoft.com/en-us/azure/application-gateway/overview
- https://quizlet.com/pl/975398961/azure-application-gateway-flash-cards/

## Azure Application Gateway components

## Azure Application Gateway architecture

![gateway](./images/app-gateway-architecture.jpg)

## Steps to configure Azure Application Gateway

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
