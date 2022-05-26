terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate1234"
    container_name       = "tfstate"
    key                  = "tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = "West Europe"
}

resource "azurerm_storage_account" "demo1" {
  name                     = var.storage_account_1
  resource_group_name      = var.resource_group_name
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
