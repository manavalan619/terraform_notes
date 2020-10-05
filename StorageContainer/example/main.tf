# Create Storage Container
module "asc" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StorageContainer/"
  project_resource_group_name = var.project_resource_group_name
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_deploy             = var.resource_deploy
  resource_index              = var.resource_index
  asa_name                    = var.asa_name
  asc_container_access_type   = var.asc_container_access_type
}