output "iothub_event_hub_events_endpoint" {
  value = azurerm_iothub.iothub.event_hub_events_endpoint
}

output "iothub_shared_access_policy" {
  value = azurerm_iothub.iothub.shared_access_policy
}
