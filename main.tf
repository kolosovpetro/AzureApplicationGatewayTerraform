resource "azurerm_resource_group" "rg_app_gateway" {
  name     = "rg-app-gateway-${var.prefix}"
  location = "northeurope"
}

resource "azurerm_service_plan" "service_plan" {
  name                = "asp-dev-qa-${var.prefix}"
  resource_group_name = azurerm_resource_group.rg_app_gateway.name
  location            = azurerm_resource_group.rg_app_gateway.location
  sku_name            = "B2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "app_service_dev" {
  name                = "ase-dev-${var.prefix}"
  resource_group_name = azurerm_resource_group.rg_app_gateway.name
  location            = azurerm_service_plan.service_plan.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {}
}

resource "azurerm_windows_web_app" "app_service_qa" {
  name                = "ase-qa-${var.prefix}"
  resource_group_name = azurerm_resource_group.rg_app_gateway.name
  location            = azurerm_service_plan.service_plan.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {}
}
