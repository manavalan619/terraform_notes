data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}

resource "azurerm_application_insights" "aai" {
  name                = var.aai_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  application_type    = var.aai_application_type
}

resource "azurerm_key_vault" "akv" {
  name                = var.akv_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.akv_sku_name
}

resource "azurerm_storage_account" "asa" {
  name                     = var.asa_name
  location                 = data.azurerm_resource_group.rg.location
  resource_group_name      = data.azurerm_resource_group.rg.name
  account_tier             = var.asa_account_tier
  account_replication_type = var.asa_account_replication_type
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}

module "aml" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AzureMachineLearningWorkspace/"
  project_resource_group_name = data.azurerm_resource_group.rg.name
  aml_application_insights_id = azurerm_application_insights.aai.id
  aml_key_vault_id            = azurerm_key_vault.akv.id
  aml_storage_account_id      = azurerm_storage_account.asa.id
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_deploy             = var.resource_deploy
  aml_sku_name                = var.aml_sku_name
  aml_friendly_name           = var.aml_friendly_name
  aml_description             = var.aml_description
  aml_container_registry_id   = azurerm_container_registry.acr.id
  aml_identity_type           = var.aml_identity_type
}
