# Create Storage Blob

module "asb" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StorageBlob/"
  project_resource_group_name = var.project_resource_group_name
  resource_deploy             = var.resource_deploy
  asa_name                    = var.asa_name
  asc_name                    = var.asc_name
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_index              = var.resource_index
  asb_type                    = var.asb_type
}
