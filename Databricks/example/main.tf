# ===============================================
# Data sources
# ===============================================

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

data "azurerm_virtual_network" "avnet" {
  name                = var.avnet_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
}

data "azurerm_subnet" "public_subnet_name" {
  name                 = var.public_subnet_name
  resource_group_name  = data.azurerm_resource_group.project_resource_group.name
  virtual_network_name = data.azurerm_virtual_network.avnet.name
}

data "azurerm_subnet" "private_subnet_name" {
  name                 = var.private_subnet_name
  resource_group_name  = data.azurerm_resource_group.project_resource_group.name
  virtual_network_name = data.azurerm_virtual_network.avnet.name
}

# ===============================================
# DATA BRICKS  MODULES
# ===============================================

module "databx4" {
  source              = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/Databricks"
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  akv_project_name    = var.akv_project_name
  resource_deploy     = var.resource_deploy
  env_code            = var.env_code
  project_name        = var.project_name
  short_project_name  = var.short_project_name
  location_code       = var.location_code
  adb_sku             = var.adb_sku
  custom_parameters = ({
    no_public_ip        = var.no_public_ip
    public_subnet_name  = data.azurerm_subnet.public_subnet_name.name
    virtual_network_id  = data.azurerm_virtual_network.avnet.id
    private_subnet_name = data.azurerm_subnet.private_subnet_name.name
  })
}
