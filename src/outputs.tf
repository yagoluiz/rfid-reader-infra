output "storage_primary_connection_string" {
  value = module.global.storage_primary_connection_string
}

output "database_asset_connection_string" {
  value = module.sql-database.database_asset_connection_string
}

output "cosmos_connection_string" {
  value = module.cosmos-database.cosmos_connection_string
}

output "servicebus_connection_string" {
  value = module.messaging.servicebus_connection_string
}

output "acr_admin_username" {
  value = module.container.acr_admin_username
}

output "acr_admin_password" {
  value = module.container.acr_admin_password
}

output "iothub_endpoint" {
  value = module.iot.iothub_event_hub_events_endpoint
}

output "iothub_shared_access_policy" {
  value = module.iot.iothub_shared_access_policy
}
