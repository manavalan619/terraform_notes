# ========================================================================
# Data sources
# ========================================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

# retreive static suffix value
data "azurerm_key_vault" "akv_tf" {
  name                = local.akv_tf_name 
  resource_group_name = local.rg_tf_name 
}
data "azurerm_key_vault_secret" "suffix_value" {
  name         = "SUFFIX"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
# reference the dedicated akv storing the AKS secret (aks server app ; aks client app and sp aks secrets)
data "azurerm_key_vault" "akv_mgt_aks_secrets" {
  name                = local.akv_aks_mgt 
  resource_group_name = local.rg_aks_mgt
} 

# ========================================================================
# Manage internal rules 
# ========================================================================
locals {

  // AKV MGT
  rg_tf_name              = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name             = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")
  // AKV AKS
  rg_aks_mgt              = local.rg_tf_name
  akv_aks_mgt             = local.akv_tf_name

  // TARGET LOG ANALYTICS SOLUTION RESOURCE NAME
  // (naming convention with static suffix included)
  # las_solution_target_name = lower("las-aks-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")

}

# ========================================================================
# Creates a Log Analytics Solution into an existing LogAnalytics Workspace
# ========================================================================
resource "azurerm_log_analytics_solution" "las" {
  solution_name         = var.las_solution_name
  location              = data.azurerm_resource_group.project_resource_group.location
  resource_group_name   = data.azurerm_resource_group.project_resource_group.name
  workspace_resource_id = var.las_workspace_resource_id
  workspace_name        = var.las_workspace_name

  plan {
    publisher = var.las_plan_publisher_name
    product   = var.las_plan_product_name
  }

  depends_on          = [var.resource_depends_on]

}