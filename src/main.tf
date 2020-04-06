provider "azurerm" {
  version = "~>2.0.0"
  features {}
}

resource "azurerm_resource_group" "rfid-rg" {
  name     = "rfid-rg"
  location = "East US"
}
