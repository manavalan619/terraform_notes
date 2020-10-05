# ======================================================
# Creates Network ddos protection plan
# ======================================================

module "andpl" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/NetworkDdosProtectionPlan/"
  project_resource_group_name = var.project_resource_group_name
  andpl_name                  = var.andpl_name
  resource_deploy             = var.resource_deploy
}
