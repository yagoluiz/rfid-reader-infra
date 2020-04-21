resource "azurerm_cosmosdb_account" "cosmos-server" {
  name                      = var.server_name
  resource_group_name       = var.rg_group_name
  location                  = var.location
  offer_type                = "Standard"
  kind                      = "GlobalDocumentDB"
  enable_automatic_failover = true

  consistency_policy {
    consistency_level       = "Strong"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 100
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmos-database" {
  name                = var.database_name
  resource_group_name = var.rg_group_name
  account_name        = azurerm_cosmosdb_account.cosmos-server.name
  throughput          = 400
}
