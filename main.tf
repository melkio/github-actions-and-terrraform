terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.28.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tf-support"
    storage_account_name = "e7ln0lb73abh0en"
    container_name       = "cloudday22"
    key                  = "tf-state"
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "container" {
  name     = "CloudDay2022"
  location = "West Europe"
}

resource "azurerm_storage_account" "demo1" {
  resource_group_name      = azurerm_resource_group.container.name
  name                     = "demo1cloudday22"
  location                 = azurerm_resource_group.container.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}