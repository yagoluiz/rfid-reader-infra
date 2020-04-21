terraform {
  required_version = ">= 0.12"
}

#
# Uncomment this provider block if you have set environment local and ignore environment variables.
# Remova o comentário deste bloco do provedor se você estiver utilizando o ambiente local e ignore as variáveis de ambiente.
#
# provider "azurerm" {
#   version = ">= 2.0.0"
#   features {}
# }

#
# Uncomment this provider block if you are using environment variables or set environment production (GitHub, etc).
# Remova o comentário deste bloco do provedor se você estiver utilizando variáveis de ambiente ou definindo o ambiente em produção (GitHub, etc).
#
provider "azurerm" {
  version         = ">= 2.0.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}
