terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "cloudState"
    storage_account_name = "cloudstate2020"
    container_name       = "xyz2304"
    key                  = "terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
}