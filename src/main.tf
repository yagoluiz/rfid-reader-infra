module "rfid-global" {
  source = "./modules/global"
}

module "rfid-messaging" {
  source = "./modules/messaging"

  rg_group_name   = module.rfid-global.resource_group_rfid_name
  servicebus_name = "rfid-service-bus"
  queue_name      = "read-tags"
}

module "rfid-registry" {
  source = "./modules/container"

  rg_group_name = module.rfid-global.resource_group_rfid_name
  acr_name      = "rfidregistry001"
}

module "rfid-sql-database" {
  source = "./modules/databases/sql"

  rg_group_name = module.rfid-global.resource_group_rfid_name
  server_name   = "rfidserver001-sql"
  database_name = "assetdb"
}

module "rfid-cosmos-database" {
  source = "./modules/databases/cosmos"

  rg_group_name = module.rfid-global.resource_group_rfid_name
  server_name   = "rfidcosmos001"
  database_name = "Rfid"
}

module "rfid-func" {
  source = "./modules/functions"

  rg_group_name                     = module.rfid-global.resource_group_rfid_name
  service_plan_name                 = "EastUSPlan"
  app_insights_name                 = "rfid-func"
  func_name                         = "rfid-func"
  storage_primary_connection_string = module.rfid-global.storage_primary_connection_string
}

module "rfid-apis" {
  source = "./modules/webapp"

  apps = {
    "asset" = {
      rg_group_name     = module.rfid-global.resource_group_rfid_name
      service_plan_name = "rfid-asset-api-asp"
      app_insights_name = "rfid-asset-api"
      webapp_name       = "rfid-asset-api"
    },
    "read" = {
      rg_group_name     = module.rfid-global.resource_group_rfid_name
      service_plan_name = "rfid-read-api-asp"
      app_insights_name = "rfid-read-api"
      webapp_name       = "rfid-read-api"
    },
    "telemetry" = {
      rg_group_name     = module.rfid-global.resource_group_rfid_name
      service_plan_name = "rfid-telemetry-api-asp"
      app_insights_name = "rfid-telemetry-api"
      webapp_name       = "rfid-telemetry-api"
    },
    "log" = {
      rg_group_name     = module.rfid-global.resource_group_rfid_name,
      service_plan_name = "rfid-log-api-asp",
      app_insights_name = "rfid-log-api"
      webapp_name       = "rfid-log-api"
    },
    "sso" = {
      rg_group_name     = module.rfid-global.resource_group_rfid_name
      service_plan_name = "rfid-sso-api-asp"
      app_insights_name = "rfid-sso-api"
      webapp_name       = "rfid-sso-api"
    },
    "gateway" = {
      rg_group_name     = module.rfid-global.resource_group_rfid_name
      service_plan_name = "rfid-gateway-api-asp"
      app_insights_name = "rfid-gateway-api"
      webapp_name       = "rfid-gateway-api"
    },
    "web" = {
      rg_group_name     = module.rfid-global.resource_group_rfid_name
      service_plan_name = "rfid-web-asp"
      app_insights_name = "rfid-reader-web"
      webapp_name       = "rfid-reader-web"
    }
  }
}
