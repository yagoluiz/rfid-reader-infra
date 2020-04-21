resource "azurerm_sql_server" "database-server" {
  name                         = var.server_name
  resource_group_name          = var.rg_group_name
  location                     = var.location
  administrator_login          = var.username
  administrator_login_password = var.password
  version                      = "12.0"
}

resource "azurerm_sql_database" "database" {
  name                = var.database_name
  resource_group_name = var.rg_group_name
  location            = var.location
  server_name         = azurerm_sql_server.database-server.name
  edition             = "Basic"
}
