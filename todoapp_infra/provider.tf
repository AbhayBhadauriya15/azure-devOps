terraform {
  required_version = "1.11.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "a7d5c3b8-efab-4b09-938f-ce6ca000d654"
}