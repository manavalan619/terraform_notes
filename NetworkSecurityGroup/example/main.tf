# ======================================================
# Creates Network security group
# ======================================================

module "ansg" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/NetworkSecurityGroup/"
  project_resource_group_name = var.project_resource_group_name
  ansg_name                   = var.ansg_name
  ansg_security_rules         = var.ansg_security_rules
  resource_deploy             = var.resource_deploy
}