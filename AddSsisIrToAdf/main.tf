# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "rg" {
  name = var.project_resource_group_name
}
data "azurerm_client_config" "current" {}

locals {
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-ne-${var.project_name}")
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

# ======================================================
# Create SSIS Integration Runtime on Datafactory
# ======================================================
resource "null_resource" "adf_ssis_ir" {
  triggers = {
    adf_ssis_ir_trigger = "${var.resource_deploy}"
  }

  provisioner "local-exec" {
    command = "pwsh -File ${path.module}/AdfSsisIr.ps1 -ResourceDeploy '${var.resource_deploy}' -TenantId  '${data.azurerm_client_config.current.tenant_id}' -ClientId  '${data.azurerm_client_config.current.client_id}' -ClientSecret  '${data.azurerm_key_vault_secret.client_secret.value}' -SubscriptionId  '${data.azurerm_client_config.current.subscription_id}'  -ResourceGroupName  '${data.azurerm_resource_group.rg.name}' -DataFactoryName  '${var.adf_name}' -DataFactoryLocation  '${data.azurerm_resource_group.rg.location}' -AzureSSISName  '${var.adf_ssis_name}' -AzureSSISDescription  '${var.adf_ssis_description}' -AzureSSISNodeSize  '${var.adf_ssis_node_size}' -AzureSSISNodeNumber  ${var.adf_ssis_node_number} -AzureSSISEdition  '${var.adf_ssis_edition}' -AzureSSISLicenseType  '${var.adf_ssis_license_type}' -AzureSSISMaxParallelExecutionsPerNode  ${var.adf_ssis_max_parallel_execution_per_node} -SetupScriptContainerSasUri  '${var.adf_ssis_setup_script_container_sas_uri}' -ExpressCustomSetup  '${var.adf_ssis_express_custom_setup}' -VnetId  '${var.adf_ssis_vnet_id}' -SubnetName  '${var.adf_ssis_subnet_name}' -FirstPublicIP  '${var.adf_ssis_first_public_ip}' -SecondPublicIP  '${var.adf_ssis_second_public_ip}' -SSISDBServerEndpoint  '${var.adf_ssis_db_server_endpoint}' -SSISDBServerAdminUserName  '${var.adf_ssis_db_server_admin_user_name}' -SSISDBServerAdminPassword  '${var.adf_ssis_db_server_admin_password}' -SSISDBPricingTier  '${var.adf_ssis_db_pricing_tier}' -DataProxyIntegrationRuntimeName  '${var.adf_ssis_data_proxy_ir_name}' -DataProxyStagingLinkedServiceName  '${var.adf_ssis_data_proxy_staging_linked_service_name}' -DataProxyStagingPath  '${var.adf_ssis_data_proxy_staging_path}' -SqlAdAdminGroupName  '${var.sqlsrv_ad_admin_group}' >> out.txt"
  }
  depends_on = [var.resource_depends_on]
}
