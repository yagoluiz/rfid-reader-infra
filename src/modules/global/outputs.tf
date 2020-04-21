output "resource_group_rfid_name" {
  value = azurerm_resource_group.rfid-rg.name
}

output "storage_name" {
  value = azurerm_storage_account.rfid-storage.name
}

output "storage_primary_connection_string" {
  value = azurerm_storage_account.rfid-storage.primary_connection_string
}
