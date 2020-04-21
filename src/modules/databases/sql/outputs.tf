output "database_asset_connection_string" {
  value = "Server=tcp:${azurerm_sql_server.database-server.fully_qualified_domain_name};Database=${azurerm_sql_database.database.name};User ID=${var.username};Password=${var.password};Trusted_Connection=False;Encrypt=True;"
}
