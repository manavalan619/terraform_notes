# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}
data "azurerm_key_vault" "akv_tf" {
  name                = local.akv_tf_name
  resource_group_name = local.rg_tf_name
}
data "azurerm_key_vault_secret" "suffix_value" {
  name         = "SUFFIX"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}
locals {
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-ne-${var.project_name}")

  // asvnr naming convention
  resource_name = lower("asvnr-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")

}

# ======================================================
# SQL Virtual Network Rule resource
# ======================================================
// NOTE: If ignore_missing_vnet_service_endpoint is false, and the target subnet 
// does not contain the Microsoft.SQL endpoint in the service_endpoints array, 
// the deployment will fail when it tries to create the SQL virtual network rule.

resource "azurerm_sql_virtual_network_rule" "asvnr" {
  count                                = (var.resource_deploy ? 1 : 0)
  name                                 = local.resource_name
  resource_group_name                  = data.azurerm_resource_group.project_resource_group.name
  server_name                          = var.asvnr_server_name    //data.azurerm_sql_server.sqlsrv.name
  subnet_id                            = var.asvnr_subnet_id      // data.azurerm_subnet.subnet.id
  ignore_missing_vnet_service_endpoint = var.asvnr_ignore_missing_vnet_service_endpoint
  
  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # timesout {
  #   create = var.asvnr_timesout_create
  #   update = var.asvnr_timesout_update
  #   read   = var.asvnr_timesout_read
  #   delete = var.asvnr_timesout_delete
  # }

  depends_on = [var.resource_depends_on]

}
