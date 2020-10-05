#Creates Event Hub Consumer Group
module "aehcg" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddEventHubConsumerGroup"
  project_resource_group_name = var.project_resource_group_name
  aehcg_namespace_name        = var.aehcg_namespace_name
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
  resource_index              = var.resource_index
  location_code               = var.location_code
  aehcg_eventhub_name         = var.aehcg_eventhub_name
  aehcg_user_metadata         = var.aehcg_user_metadata
  resource_depends_on         = var.resource_depends_on
  resource_deploy             = var.resource_deploy
}
