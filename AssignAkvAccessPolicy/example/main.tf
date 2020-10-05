# Create ressources group
module "role" {
  source               = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AssignAkvAccessPolicy/"
  aad_group_list       = var.aad_group_list
  role_scope_ids       = var.role_scope_ids
  role_definition_name = var.role_definition_name
  resource_depends_on  = var.resource_depends_on
}