# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

data "azurerm_app_service_plan" "aasp" {
  name                = var.aasp_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
}
// Resource naming convention
// Retrieve SUFFIX secret value for akv target name
data "azurerm_key_vault" "akv_tf" {
  name                = local.akv_tf_name
  resource_group_name = local.rg_tf_name
}
data "azurerm_key_vault_secret" "suffix_value" {
  name         = "SUFFIX"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
locals {
  dv = [upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TMA")]
  at = []
  hp = []
  p  = []

  contrib     = "Contributor"
  reader      = "Reader"
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // aas Project naming convention
  resource_name = lower("aas-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
}
# ======================================================
# Creates App Service
# ======================================================
resource "azurerm_app_service" "aas" {
  name                = local.resource_name
  location            = data.azurerm_resource_group.project_resource_group.location
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  app_service_plan_id = data.azurerm_app_service_plan.aasp.id

  site_config {
    dotnet_framework_version = var.aas_site_config_dotnet_framework_version
    scm_type                 = var.aas_site_config_scm_type
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = var.aas_connection_string_name
    type  = var.aas_connection_string_type
    value = var.aas_connection_string_value
  }

  tags  = data.azurerm_resource_group.project_resource_group.tags
  count = (var.resource_deploy ? 1 : 0)
}

# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_app_service.aas : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
}
