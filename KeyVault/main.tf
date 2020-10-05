# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
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

# ======================================================
# Manages internal rules and resources naming rules 
# ======================================================
locals {

  // Manage RBACs on keyvault
  dv = [upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TMA")]
  at = [upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TMA")]
  hp = [upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TMA")]
  p  = [upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.project_resource_group.tags.Branch}-${var.project_name}-TMA")]

  contrib = "Contributor"
  reader  = "Reader"

  // AKV Mgt
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // AKV Project naming convention
  akv_target_project_name = lower("akv-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")

}

# ======================================================
# Creates Key Vault
# ======================================================
resource "azurerm_key_vault" "akv" {
  name                        = local.akv_target_project_name
  location                    = data.azurerm_resource_group.project_resource_group.location
  resource_group_name         = data.azurerm_resource_group.project_resource_group.name
  enabled_for_disk_encryption = var.akv_enabled_for_disk_encryption
  soft_delete_enabled         = var.akv_soft_delete_enabled
  purge_protection_enabled    = var.akv_purge_protection_enabled
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.akv_sku_name
  tags                        = data.azurerm_resource_group.project_resource_group.tags


  enabled_for_deployment          = var.akv_enabled_for_deployment
  enabled_for_template_deployment = var.akv_enabled_for_template_deployment

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # network_acls {
  #   bypass         = var.akv_network_acls_bypass
  #   default_action = var.akv_network_acls_default_action
  #   ip_rules       = var.akv_network_acls_ip_rules
  #   virtual_network_subnet_ids = var.akv_network_acls_virtual_network_subnet_ids
  # }
  # timeouts {
  #   create = var.akv_timeouts_create
  #   update = var.akv_timeouts_update
  #   read   = var.akv_timeouts_read
  #   delete = var.akv_timeouts_delete
  # }

  count = (var.resource_deploy ? 1 : 0)

}

# ======================================================
# Adds access policy to sp terraform
# ======================================================
module "akv_access_policy" {
  # resource_deploy                  = var.resource_deploy
  source                           = "../KeyVaultAccessPolicy/"
  akv_access_policy_key_vault_id   = var.resource_deploy ? azurerm_key_vault.akv[0].id : ""
  akv_access_policy_object_ids     = var.resource_deploy ? [data.azurerm_client_config.current.object_id] : []
  akv_access_policy_security_level = var.akv_access_policy_security_level
  resource_depends_on              = [azurerm_key_vault.akv]
}

# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignAkvAccessPolicy/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_key_vault.akv : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
  resource_depends_on  = [azurerm_key_vault.akv]
}
