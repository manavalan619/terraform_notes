module "adf-ssis-ir" {
  source                                   = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES/providers/azure/AddSsisIrToAdf"
  adf_name                                 = var.adf_name
  project_resource_group_name              = var.project_resource_group_name
  project_name                             = var.project_name
  env_code                                 = var.env_code
  resource_deploy                          = var.resource_deploy
  resource_depends_on                      = var.resource_depends_on
  adf_ssis_name                            = var.adf_ssis_name
  adf_ssis_description                     = var.adf_ssis_description
  adf_ssis_node_size                       = var.adf_ssis_node_size
  adf_ssis_node_number                     = var.adf_ssis_node_number
  adf_ssis_edition                         = var.adf_ssis_edition
  adf_ssis_license_type                    = var.adf_ssis_license_type
  adf_ssis_max_parallel_execution_per_node = var.adf_ssis_max_parallel_execution_per_node
  adf_ssis_setup_script_container_sas_uri  = var.adf_ssis_setup_script_container_sas_uri
  adf_ssis_express_custom_setup            = var.adf_ssis_express_custom_setup
  adf_ssis_vnet_id                         = var.adf_ssis_vnet_id
  adf_ssis_subnet_name                     = var.adf_ssis_subnet_name
  adf_ssis_db_server_endpoint              = var.adf_ssis_db_server_endpoint
  adf_ssis_db_server_admin_user_name       = var.adf_ssis_db_server_admin_user_name
  adf_ssis_db_server_admin_password        = var.adf_ssis_db_server_admin_password
  adf_ssis_db_pricing_tier                 = var.adf_ssis_db_pricing_tier
}

