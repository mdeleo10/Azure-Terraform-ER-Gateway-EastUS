# Terraform GitHub storage account for state output
#
#
# Create Storage Account Container
# Suggestion: create tfstate-repo-name, needs to be lower case only
#
# az storage container create -n az storage container create -n tftstate-azure-terraform-er-gateway-eastus --account-name  cloudmdterraformstate
#


terraform {
  backend "azurerm" {
    resource_group_name     = "rg-terraform-state-001"
    storage_account_name    = "cloudmdterraformstate"
    container_name          = "tftstate-azure-terraform-er-gateway-eastus"
    key                     = "tfstate"
  }
}


# Define Resource Group Name, including the Azure Region
  resource "azurerm_resource_group" "rg" {
    name      = "rg-${var.resource_group_name_prefix}-${var.resource_group_location}"
    location  = var.resource_group_location
    tags = {
        Source = "terraform"
        Environment = "development"
        CreatedDate = timestamp()
    }
  }

# Azure ExpressRoute Circuit
resource azurerm_express_route_circuit "express_route" {
    name                  = "er-${var.resource_group_name_prefix}-${var.resource_group_location}"
    resource_group_name   = azurerm_resource_group.rg.name
    location              = azurerm_resource_group.rg.location

    # https://docs.microsoft.com/en-us/azure/expressroute/expressroute-locations-providers
    service_provider_name = "Coresite"
    peering_location      = "Washington DC"
    bandwidth_in_mbps     = 50

    sku {
        tier   = "Standard"  
        family = "MeteredData" 
    }
}


