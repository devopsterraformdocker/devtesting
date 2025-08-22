terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "Agrawest"
    storage_account_name = "aug15"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "statefile"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}


provider "azurerm" {
    features {}
  subscription_id = "5e4fafbb-ef69-4e17-8835-68030d81f758"
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
