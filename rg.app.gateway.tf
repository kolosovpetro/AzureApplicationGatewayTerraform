resource "azurerm_resource_group" "rg_app_gateway" {
  name     = "rg-app-gateway-${var.name_prefix}"
  location = "northeurope"
}
