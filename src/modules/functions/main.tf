resource "azurerm_app_service_plan" "func-plan" {
  name                = var.service_plan_name
  resource_group_name = var.rg_group_name
  location            = var.location
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_application_insights" "insights-func" {
  name                = var.app_insights_name
  resource_group_name = var.rg_group_name
  location            = var.location
  application_type    = "web"
}

resource "azurerm_function_app" "func-app" {
  name                      = var.func_name
  resource_group_name       = var.rg_group_name
  storage_connection_string = var.storage_primary_connection_string
  location                  = var.location
  app_service_plan_id       = azurerm_app_service_plan.func-plan.id
  version                   = "~2"

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME  = "dotnet"
    ASPNETCORE_DETAILEDERRORS = "true"
    FUNCTION_APP_EDIT_MODE    = "readwrite"
  }
}
