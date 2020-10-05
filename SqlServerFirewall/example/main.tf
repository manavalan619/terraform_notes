# ======================================================
# SQL Firewall Rule Module
# ======================================================
module "sql_srv_fw" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/SqlServerFirewall/"
  project_resource_group_name = var.project_resource_group_name
  sqlsrv_name                 = var.sqlsrv_name
  sqlsrv_fw_rules             = var.sqlsrv_fw_rules
  resource_deploy             = var.resource_deploy
  resource_depends_on         = var.resource_depends_on
}