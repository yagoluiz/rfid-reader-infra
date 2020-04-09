resource "azurerm_resource_group" "rfid-rg" {
  name     = "rfid-rg"
  location = var.location
}

module "rfid-apis" {
  source = "./modules/webapp"

  apps = {
    "asset" = {
      rg_group_name     = azurerm_resource_group.rfid-rg.name,
      service_plan_name = "rfid-asset-api-asp",
      app_insights_name = "rfid-asset-api"
      webapp_name       = "rfid-asset-api"
    },
    "read" = {
      rg_group_name     = azurerm_resource_group.rfid-rg.name,
      service_plan_name = "rfid-read-api-asp",
      app_insights_name = "rfid-read-api"
      webapp_name       = "rfid-read-api"
    },
    "telemetry" = {
      rg_group_name     = azurerm_resource_group.rfid-rg.name,
      service_plan_name = "rfid-telemetry-api-asp",
      app_insights_name = "rfid-telemetry-api"
      webapp_name       = "rfid-telemetry-api"
    },
    "log" = {
      rg_group_name     = azurerm_resource_group.rfid-rg.name,
      service_plan_name = "rfid-log-api-asp",
      app_insights_name = "rfid-log-api"
      webapp_name       = "rfid-log-api"
    },
    "sso" = {
      rg_group_name     = azurerm_resource_group.rfid-rg.name,
      service_plan_name = "rfid-sso-api-asp",
      app_insights_name = "rfid-sso-api"
      webapp_name       = "rfid-sso-api"
    },
    "gateway" = {
      rg_group_name     = azurerm_resource_group.rfid-rg.name,
      service_plan_name = "rfid-gateway-api-asp",
      app_insights_name = "rfid-gateway-api"
      webapp_name       = "rfid-gateway-api"
    },
    "web" = {
      rg_group_name     = azurerm_resource_group.rfid-rg.name,
      service_plan_name = "rfid-web-asp",
      app_insights_name = "rfid-reader-web"
      webapp_name       = "rfid-reader-web"
    }
  }
}
