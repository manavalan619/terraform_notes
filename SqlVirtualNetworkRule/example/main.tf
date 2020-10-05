module "asvnr" {
  source                                     = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/SqlVirtualNetworkRule"
  project_resource_group_name                = var.project_resource_group_name
  avnet_name                                 = var.avnet_name
  subnet_name                                = var.subnet_name
  sqlsrv_name                                = var.sqlsrv_name
  project_name                               = var.project_name
  env_code                                   = var.env_code
  short_project_name                         = var.short_project_name
  resource_deploy                            = var.resource_deploy
  asvnr_ignore_missing_vnet_service_endpoint = var.asvnr_ignore_missing_vnet_service_endpoint
}
