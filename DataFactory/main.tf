# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}

# used to retreive tenant_id (+ object_id the the sp terraform) from the current client config
data "azurerm_client_config" "current" {}

#the sp must have read RBAC on the key vault
data "azurerm_key_vault" "akv_tf" {
  name                = local.akv_tf_name
  resource_group_name = local.rg_tf_name
}
data "azurerm_key_vault_secret" "client_secret" {
  name         = "ARM-CLIENT-SECRET"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
data "azurerm_key_vault_secret" "suffix_value" {
  name         = "SUFFIX"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

locals {
  dv = [upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TMA")]
  at = [upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TMA")]
  hp = [upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TMA")]
  p  = [upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TECHLEAD"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-DEVELOPER"), upper("ZG-AZR-${data.azurerm_resource_group.rg.tags.Branch}-${var.project_name}-TMA")]

  contrib = "Contributor"
  reader  = "Reader"


  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")


  SharedDataFactoryName        = upper(var.env_code) == "P" ? lookup(lookup(var.shared_adf_name, data.azurerm_resource_group.rg.tags.Branch), "P") : lookup(lookup(var.shared_adf_name, data.azurerm_resource_group.rg.tags.Branch), "HP")
  SharedIntegrationRuntimeName = upper("MAIN-${data.azurerm_resource_group.rg.tags.Branch}")
  SharedResourceGroupName      = upper(var.env_code) == "P" ? "rg-total-p-we-integrationruntimes" : "rg-total-hp-we-integrationruntimes"
  SharedSubscriptionId         = upper(var.env_code) == "P" ? "38d63019-c94c-4f3b-ae71-42c8624b7cc3" : "a751e132-bcc0-4bae-a451-a70cd9f379ef"

  git_config_deploy = var.vsts_configuration != null ? true : false

  // adf Project naming convention
  resource_name = lower("adf-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
}

# ======================================================
# Creates Data Factory
# ======================================================
resource "azurerm_data_factory" "adf" {
  name                = local.resource_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  tags                = data.azurerm_resource_group.rg.tags

  identity {
    type = "SystemAssigned"
  }

  dynamic "vsts_configuration" {
    for_each = var.vsts_configuration != null ? [var.vsts_configuration] : []
    content {
      account_name    = vsts_configuration.value.account_name
      branch_name     = vsts_configuration.value.branch_name
      project_name    = vsts_configuration.value.project_name
      repository_name = vsts_configuration.value.repository_name
      root_folder     = vsts_configuration.value.root_folder
      tenant_id       = vsts_configuration.value.tenant_id
    }
  }

  count = (var.resource_deploy ? 1 : 0)
}


# ======================================================
# Creates Shared Integration Runtion in datafactory
# ======================================================
resource "null_resource" "link_adf_ir" {
  triggers = {
    link_adf_ir_trigger = "${var.resource_deploy_integration_runtime}"
  }

  provisioner "local-exec" {
    command = "pwsh -File ${path.module}/ADFLinkSharedIR.ps1 -ResourceDeploy ${var.resource_deploy_integration_runtime} -TenantId ${data.azurerm_client_config.current.tenant_id} -ClientId ${data.azurerm_client_config.current.client_id} -ClientSecret ${data.azurerm_key_vault_secret.client_secret.value} -SubscriptionId ${data.azurerm_client_config.current.subscription_id} -SharedDataFactoryName ${local.SharedDataFactoryName} -SharedIntegrationRuntimeName ${local.SharedIntegrationRuntimeName} -SharedResourceGroupName ${local.SharedResourceGroupName} -SharedSubscriptionId ${local.SharedSubscriptionId} -LinkedDataFactoryName ${var.resource_deploy_integration_runtime ? [for instance in azurerm_data_factory.adf : instance.name][0] : 0} -LinkedResourceGroupName ${data.azurerm_resource_group.rg.name} >> out.txt"
  }

  depends_on = [azurerm_data_factory.adf]

}

# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_data_factory.adf : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
  # resource_depends_on  = [azurerm_data_factory.adf]
}
