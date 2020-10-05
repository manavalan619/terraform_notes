# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}
# used to retreive tenant_id (+ object_id the the sp terraform) from the current client config
data "azurerm_client_config" "current" {}

#the sp must have read RBAC on the key vault
data "azurerm_key_vault" "akv_tf" {
  name                = var.akv_tf_name
  resource_group_name = var.rg_tf_name
}
data "azurerm_key_vault_secret" "client_secret" {
  name         = "ARM-CLIENT-SECRET"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
# ======================================================
# Creates ADLS output in StreamAnalytics
# ======================================================
resource "azurerm_template_deployment" "sta_adls_output" {
  name                = var.sta_adls_output_deployment_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  template_body       = file("${path.module}/arm/template.json")

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters = {
    sta_job_name                     = var.sta_job_name,
    sta_output_adls_name             = var.sta_output_adls_name,
    sta_output_adls_file_Path_Prefix = var.sta_output_adls_file_Path_Prefix,
    adls_name                        = var.adls_name
  }

  provisioner "local-exec" {
    when    = destroy
    command = "pwsh -File ${path.module}/DeleteResource.ps1 -ResourceDeploy ${var.resource_deploy} -TenantId ${data.azurerm_client_config.current.tenant_id} -ClientId ${data.azurerm_client_config.current.client_id} -ClientSecret ${data.azurerm_key_vault_secret.client_secret.value} -Resource ${self.outputs.sta_output_adls_id} -SubscriptionId ${data.azurerm_client_config.current.subscription_id} >> outALDS.txt"
  }

  deployment_mode = "Incremental"

  count      = (var.resource_deploy ? 1 : 0)
  depends_on = [var.resource_depends_on]

}

# ======================================================
# Delete deployed compenent
# ======================================================
# resource "null_resource" "delete_resource"  {
#   triggers = {
#     adb_token_trigger = "${var.resource_deploy}"
#   }
#   provisioner "local-exec" {
#     command = "pwsh -File ${path.module}/DeleteResource.ps1 -ResourceDeploy ${var.resource_deploy} -TenantId ${data.azurerm_client_config.current.tenant_id} -ClientId ${data.azurerm_client_config.current.client_id} -ClientSecret ${data.azurerm_key_vault_secret.client_secret.value} -Resourcegroup ${data.azurerm_resource_group.project_resource_group.name} -Resource ${azurerm_template_deployment.sta_adls_output[0].outputs.sta_output_adls_id} -SubscriptionId ${data.azurerm_client_config.current.subscription_id} >> out.txt"
#   }
# }
