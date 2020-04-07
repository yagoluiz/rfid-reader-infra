resource "azurerm_resource_group" "rfid-rg" {
  name     = "rfid-rg"
  location = var.location
}

resource "azurerm_app_service_plan" "webapp-linux" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rfid-rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "docker-api" {
  name                = "${var.webapp_name}-api"
  location            = var.location
  resource_group_name = azurerm_resource_group.rfid-rg.name
  app_service_plan_id = azurerm_app_service_plan.webapp-linux.id
}
