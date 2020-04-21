output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_primary_connection_string" {
  value = azurerm_storage_account.storage.primary_connection_string
}
