variable "name_prefix" {
  type        = string
  description = "Prefix for all resources"
}

variable "app_service_environments" {
  type = map(object({
    location             = string
    display_name         = string
    virtual_network_name = string
    resource_group_name  = string
  }))
  default = {
    eastus = {
      location             = "East US"
      display_name         = "East US"
      virtual_network_name = "eastus-vnet"
      resource_group_name  = "eastus-rg"
    }
    westus = {
      location             = "West US"
      display_name         = "West US"
      virtual_network_name = "westus-vnet"
      resource_group_name  = "westus-rg"
    }
    centralus = {
      location             = "Central US"
      display_name         = "Central US"
      virtual_network_name = "centralus-vnet"
      resource_group_name  = "centralus-rg"
    }
    northeurope = {
      location             = "North Europe"
      display_name         = "North Europe"
      virtual_network_name = "northeurope-vnet"
      resource_group_name  = "northeurope-rg"
    }
    westeurope = {
      location             = "West Europe"
      display_name         = "West Europe"
      virtual_network_name = "westeurope-vnet"
      resource_group_name  = "westeurope-rg"
    }
  }
}
