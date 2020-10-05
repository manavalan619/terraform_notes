# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}

# used to retreive tenant_id (+ object_id the the sp terraform) from the current client config
data "azurerm_client_config" "current" {}


locals {
  dv = [upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TMA")]
  at = []
  hp = []
  p  = []

  contrib = "Contributor"
  reader  = "Reader"

  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  pwsh_adb_name     = var.resource_deploy ? azurerm_databricks_workspace.adb[0].name : "null"
  pwsh_adb_location = var.resource_deploy ? azurerm_databricks_workspace.adb[0].location : "null"

  // ADB Project naming convention
  resource_name   = lower("adb-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
  
  akv_project_name= lower("akv-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")

}


#the sp must have read RBAC on the key vault
data "azurerm_key_vault" "akv_tf" {
  name                = local.akv_tf_name
  resource_group_name = local.rg_tf_name
}

data "azurerm_key_vault_secret" "client_secret" {
  name         = "ARM-CLIENT-SECRET"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

// Resource naming convention
// Retrieve SUFFIX secret value for akv name

data "azurerm_key_vault_secret" "suffix_value" {
  name         = "SUFFIX"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

# ======================================================
# give_adb_owner_authorization
# ======================================================
# data "azurerm_subscription" "primary" {}

# resource "azurerm_role_assignment" "give_adb_owner_authorization" {
#   count              = var.resource_deploy ? 1 : 0
#   scope              = "/subscriptions/${data.azurerm_subscription.primary.subscription_id}" // "${data.azurerm_client_config.current.subscription_id}" //"/subscriptions/${data.azurerm_subscription.primary.id}" //data.azurerm_client_config.current.subscription_id
#   role_definition_id = "8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
#   principal_id       = "9a74af6f-d153-4348-988a-e2672920bee9"
# }

# ======================================================
# Creates Databricks worskpace
# ======================================================
resource "azurerm_databricks_workspace" "adb" {
  count               = var.resource_deploy ? 1 : 0
  name                = local.resource_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sku                 = var.adb_sku
  tags                = data.azurerm_resource_group.rg.tags

 // NOTE Databricks requires that a network security group is associated 
 // with public and private subnets when virtual_network_id is set.

 // NOTE Databricks requires that a network security group is associated 
 // with public and private subnets when virtual_network_id is set.

 dynamic "custom_parameters" {
    for_each = var.adb_custom_parameters != null ? [var.adb_custom_parameters] : []
    content {
      no_public_ip        = var.adb_custom_parameters.no_public_ip        // Are public IP Addresses not allowed?
      public_subnet_name  = var.adb_custom_parameters.public_subnet_name  // Public Subnet name within the ADB Vnet. Required if virtual_network_id is set.
      private_subnet_name = var.adb_custom_parameters.private_subnet_name // Private Subnet name within the ADB Vnet. Required if virtual_network_id is set.
      virtual_network_id  = var.adb_custom_parameters.virtual_network_id  // VNET_ID where ADB should be created.
    }
  }

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # managed_resource_group_name = var.adb_managed_resource_group_name

  depends_on = [var.resource_depends_on]
  
}


# ======================================================
# Creates Databricks token
# ======================================================
resource "null_resource" "create_token" {
  triggers = {
    adb_token_trigger = "${var.resource_deploy}"
  }
  provisioner "local-exec" {
    command = "pwsh -File ${path.module}/DBXCreateToken.ps1 -ResourceDeploy ${var.resource_deploy} -TenantId ${data.azurerm_client_config.current.tenant_id} -ClientId ${data.azurerm_client_config.current.client_id} -ClientSecret ${data.azurerm_key_vault_secret.client_secret.value} -Region ${local.pwsh_adb_location} -Resourcegroup ${data.azurerm_resource_group.rg.name} -Resource ${local.pwsh_adb_name} -SubscriptionId ${data.azurerm_client_config.current.subscription_id} -vaultName ${local.akv_project_name}"
  }
  depends_on = [azurerm_databricks_workspace.adb]
}

# provisioner "local-exec" {
# 	command = <<EOT
# 		pwsh -File ${path.module}/DBXCreateToken.ps1 -ResourceDeploy ${var.resource_deploy} -TenantId ${data.azurerm_client_config.current.tenant_id} -ClientId ${data.azurerm_client_config.current.client_id} -ClientSecret ${data.azurerm_key_vault_secret.client_secret.value} -Region ${local.pwsh_adb_location} -Resourcegroup ${data.azurerm_resource_group.rg.name} -Resource ${local.pwsh_adb_name} -SubscriptionId ${data.azurerm_client_config.current.subscription_id} -vaultName ${var.akv_project_name} >> out.txt
# 		cat out.txt
# 	EOT
# }

# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_databricks_workspace.adb : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
}
