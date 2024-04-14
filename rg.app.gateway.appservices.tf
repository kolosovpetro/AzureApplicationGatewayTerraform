resource "azurerm_service_plan" "rg_app_gateway_service_plan" {
  name                = "asp-app-gateway-${var.name_prefix}"
  resource_group_name = azurerm_resource_group.rg_app_gateway.name
  location            = azurerm_resource_group.rg_app_gateway.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "example" {
  name                = "ase-app-gateway-${var.name_prefix}"
  resource_group_name = azurerm_resource_group.rg_app_gateway.name
  location            = azurerm_service_plan.rg_app_gateway_service_plan.location
  service_plan_id     = azurerm_service_plan.rg_app_gateway_service_plan.id

  site_config {}
}