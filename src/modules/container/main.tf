resource "azurerm_container_registry" "acr-apis" {
  name                = var.acr_name
  resource_group_name = var.rg_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true
}
