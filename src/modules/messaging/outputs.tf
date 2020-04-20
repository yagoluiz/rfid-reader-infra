output "servicebus_connection_string" {
  value = azurerm_servicebus_namespace.servicebus-namespace.default_primary_connection_string
}
