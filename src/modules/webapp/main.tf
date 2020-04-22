resource "azurerm_app_service_plan" "api-plan" {
  for_each            = var.apps
  name                = each.value.service_plan_name
  resource_group_name = each.value.rg_group_name
  location            = var.location
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_application_insights" "insights-api" {
  for_each            = var.apps
  name                = each.value.app_insights_name
  resource_group_name = each.value.rg_group_name
  location            = var.location
  application_type    = "web"
}

resource "azurerm_app_service" "docker-api" {
  for_each            = var.apps
  name                = each.value.webapp_name
  resource_group_name = each.value.rg_group_name
  location            = var.location
  app_service_plan_id = azurerm_app_service_plan.api-plan[each.key].id

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.insights-api[each.key].instrumentation_key
    "ASPNETCORE_ENVIRONMENT"         = "Production"
  }
}
