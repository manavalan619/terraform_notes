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

  // ACR naming convention
  resource_name = lower("acr${var.env_code}${var.short_project_name}${data.azurerm_key_vault_secret.suffix_value.value}")

}

# ======================================================
# Creates Key Vault
# ======================================================
resource "azurerm_container_registry" "acr" {
  count               = (var.resource_deploy ? 1 : 0)
  name                = local.resource_name
  location            = data.azurerm_resource_group.project_resource_group.location
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  sku                 = var.acr_sku           // must be premium to manage vnet rules (see the NOTE below)
  admin_enabled       = var.acr_admin_enabled // set to true

  // NOTE: network_rule_set block is only supported with the Premium SKU at this time.
  # network_rule_set {
  #   default_action = var.acr_network_rule_set_default_action // Default value  = "Allow"

  #   // ip_rule blocks
  #   dynamic "ip_rule" {
  #     for_each = var.acr_ip_rule != null ? [var.acr_ip_rule] : [] 
  #     content {
  #       action   = var.acr_ip_rule.action   // (Required) The behaviour for requests matching this rule. At this time the only supported value is Allow
  #       ip_range = var.acr_ip_rule.ip_range // (Required) The CIDR block from which requests will match the rule.
  #     }
  #   }
  #   // vnet blocks
  #    dynamic "virtual_network" {
  #     for_each = var.acr_vnet != null ? [var.acr_vnet] : [] 
  #     content  {
  #       action    = var.acr_vnet.action    // (Required) The behaviour for requests matching this rule. At this time the only supported value is Allow
  #       subnet_id = var.acr_vnet.subnet_id // (Required) The subnet id from which requests will match the rule.
  #     }
  #   }

  # }

  tags                = data.azurerm_resource_group.project_resource_group.tags
  depends_on          = [var.resource_depends_on]

}
