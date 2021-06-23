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
    azuread = {
      source  = "hashicorp/azuread"
      version = "1.4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}

resource "azuread_application" "main" {
  display_name = "demo1234"
}

resource "azuread_service_principal" "main" {
  application_id = azuread_application.main.application_id
}

resource "random_string" "password" {
  length = 32
}

resource "azuread_service_principal_password" "main" {
  service_principal_id = azuread_service_principal.main.id
  value                = random_string.password.result
  end_date_relative    = "8760h"
}

