resource "azurerm_resource_group" "rfid-rg" {
  name     = var.rg_group_name
  location = var.location
}

resource "azurerm_storage_account" "rfid-storage" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.rfid-rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
