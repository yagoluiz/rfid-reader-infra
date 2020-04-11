resource "azurerm_resource_group" "rfid-rg" {
  name     = "rfid-rg"
  location = var.location
}

resource "azurerm_storage_account" "rfid-storage" {
  name                     = "rfidstorage001"
  resource_group_name      = azurerm_resource_group.rfid-rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
