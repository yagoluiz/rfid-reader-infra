output "storage_primary_connection_string" {
  value = module.rfid-global.storage_primary_connection_string
}

output "database_asset_connection_string" {
  value = module.rfid-sql-database.database_asset_connection_string
}

output "cosmos_connection_string" {
  value = module.rfid-cosmos-database.cosmos_connection_string
}
