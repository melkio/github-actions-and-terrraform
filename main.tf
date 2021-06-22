terraform {
  backend "azurerm" {
    resource_group_name  = "melkio-tfstate"
    storage_account_name = "melkiotfstate"
    container_name       = "tfstate"
    key                  = "github.tfstate"
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
