# Infrastructure RFID Tag Reading

![Terraform CI](https://github.com/yagoluiz/rfid-reader-infra/workflows/Terraform%20CI/badge.svg)

Infrastructure RFID Tag Reading, implemented after Master's Work.

## Project architecture

This repository provides the implementation of infrastructure of the projects [rfid-reader-middleware](https://github.com/yagoluiz/rfid-reader-middleware), [rfid-reader-api](https://github.com/yagoluiz/rfid-reader-api) and [rfid-reader-web](https://github.com/yagoluiz/rfid-reader-web).

![](img/azure_services.png)

## Project structure

The infrastructure was organized through [modules](https://www.terraform.io/docs/configuration/modules.html).

```
├── src
    ├── modules (resources)
        ├── container
        ├── databases
        ├── functions
        ...
    ├── main.tf (execute modules)
    ├── outputs.tf (connections)
    ├── provider.tf (Azure)
...
```

## Master's work

See the work [repository](https://github.com/yagoluiz/unb-dissertacao) for more details of the project.

## Technologies

- Terraform (Azure Provider)
- Azure CLI

## Instructions for run project

1. Install [Terraform](https://www.terraform.io/downloads.html)

2. Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

3. Azure account login

> *az login*

4. *(Optional)* Create *service principal* credentials for Azure authentication

> *az ad sp create-for-rbac --name "{NAME}" --role contributor --scopes /subscriptions/{YOUR_AZURE_SUBSCRIPTION_ID}*

Result create service principal:

```json
{ 
  "clientId": "{AZURE_CLIENT_ID}",
  "clientSecret": "{AZURE_CLIENT_SECRET}",
  "subscriptionId": "{AZURE_SUBSCRIPTION_ID}",
  "tenantId": "{AZURE_TENANT_ID}",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```

Use variables **clientId**, **clientSecret**, **subscriptionId** and **tenantId** in provider:

```terraform
provider "azurerm" {
  version         = ">= 2.0.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}
```

In this project the variables are in **GitHub Secrets**.

5. In path **src** in project root execute desired the commands Terraform

> *terraform init* **(install modules and provider)**

> *terraform validate* **(validate scripts)**

> *terraform apply* **(apply infrastructure)**

> *terraform destroy* **(remove infrastructure)**

More [commands](https://www.terraform.io/docs/commands/index.html).

# [PT-BR] Infraestrutura de Leitura de Tags RFID

Infraestrutura de Leitura de Tags RFID, implementado após trabalho de Mestrado.

## Arquitetura do projeto

Este repositório apresenta a implementação de toda infraestrutura dos projetos [rfid-reader-middleware](https://github.com/yagoluiz/rfid-reader-middleware), [rfid-reader-api](https://github.com/yagoluiz/rfid-reader-api) e [rfid-reader-web](https://github.com/yagoluiz/rfid-reader-web).

## Estrutura do projeto

A infraestrutura foi organizada através de [módulos](https://www.terraform.io/docs/configuration/modules.html).

```
├── src
    ├── modules (recursos)
        ├── container
        ├── databases
        ├── functions
        ...
    ├── main.tf (executar módulos)
    ├── outputs.tf (conexões)
    ├── provider.tf (Azure)
...
```

## Trabalho de Mestrado

Consulte o [repositório](https://github.com/yagoluiz/unb-dissertacao) do trabalho para mais detalhes do projeto.

## Tecnologias

- Terraform (Azure Provider)
- Azure CLI

## Instruções para execução do projeto

1. Instalar [Terraform](https://www.terraform.io/downloads.html)

2. Instalar [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

3. Logar em uma conta Azure

> *az login*

4. *(Opcional)* Criar credenciais *service principal* para autenticação no Azure

> *az ad sp create-for-rbac --name "{NAME}" --role contributor --scopes /subscriptions/{SEU_AZURE_SUBSCRIPTION_ID}*

Resultado da criação do *service principal*:

```json
{
  "clientId": "{AZURE_CLIENT_ID}",
  "clientSecret": "{AZURE_CLIENT_SECRET}",
  "subscriptionId": "{AZURE_SUBSCRIPTION_ID}",
  "tenantId": "{AZURE_TENANT_ID}",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```

Utilize variáveis **clientId**, **clientSecret**, **subscriptionId** e **tenantId** no provider:

```terraform
provider "azurerm" {
  version         = ">= 2.0.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}
```

Neste projeto as variáveis estão no **GitHub Secrets**.

5. Na pasta **src** na raíz do projeto executar os comandos Terraform desejados

> *terraform init* **(iniciar modulos e provider)**

> *terraform validate* **(validar scripts)**

> *terraform apply* **(aplicar infraestrutura)**

> *terraform destroy* **(remover infraestrutura)**

Mais [comandos](https://www.terraform.io/docs/commands/index.html).
