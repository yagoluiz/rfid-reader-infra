resource "azurerm_storage_container" "iothub-container" {
  name                  = var.container_name
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}

resource "azurerm_iothub" "iothub" {
  name                = var.iothub_name
  resource_group_name = var.rg_group_name
  location            = var.location

  sku {
    name     = "S1"
    capacity = "1"
  }

  endpoint {
    type              = "AzureIotHub.StorageContainer"
    connection_string = var.storage_primary_connection_string
    container_name    = azurerm_storage_container.iothub-container.name
    name              = "export"
  }

  route {
    name           = "Rfid"
    source         = "DeviceMessages"
    condition      = "true"
    endpoint_names = ["export"]
    enabled        = true
  }
}

resource "azurerm_iothub_consumer_group" "iothub-consumer" {
  name                   = var.iothub_consumer_name
  resource_group_name    = var.rg_group_name
  eventhub_endpoint_name = "events"
  iothub_name            = azurerm_iothub.iothub.name
}
