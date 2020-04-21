output "cosmos_connection_string" {
  value = "AccountEndpoint=${azurerm_cosmosdb_account.cosmos-server.endpoint};AccountKey=${azurerm_cosmosdb_account.cosmos-server.primary_master_key};"
}
