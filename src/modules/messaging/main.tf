resource "azurerm_servicebus_namespace" "servicebus-namespace" {
  name                = var.servicebus_name
  location            = var.location
  resource_group_name = var.rg_group_name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "servicebus-read-queue" {
  name                  = var.queue_name
  resource_group_name   = var.rg_group_name
  namespace_name        = azurerm_servicebus_namespace.servicebus-namespace.name
  enable_partitioning   = true
  max_size_in_megabytes = 1024
}

