terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }
}

provider "azurerm" {
    features {}
  subscription_id = "6ed7f7b6-cebf-4b7b-9cf5-15e8c63f509f"
  # Configuration options
}

resource "azurerm_resource_group" "rgarchit1" {
  name     = "RG-Archit1"
  location = "East US"
}
resource "azurerm_storage_account" "starchit" {
  name                     = "starchit01"
  resource_group_name      = azurerm_resource_group.rgarchit1.name
  location                 = azurerm_resource_group.rgarchit1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
