output "cosmos_connection_string" {
  value = "AccountEndpoint=${azurerm_cosmosdb_account.rfid-cosmos-server.endpoint};AccountKey=${azurerm_cosmosdb_account.rfid-cosmos-server.primary_master_key};"
}
