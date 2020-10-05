#Creates ADLS
module "sta_adls_output" {
  source                           = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddOutputStreamAnalyticstADLSgen1/"
  project_resource_group_name      = var.project_resource_group_name
  rg_tf_name                       = var.rg_tf_name
  akv_tf_name                      = var.akv_tf_name
  sta_adls_output_deployment_name  = var.sta_adls_output_deployment_name
  sta_job_name                     = var.sta_job_name
  sta_output_adls_name             = var.sta_output_adls_name
  sta_output_adls_file_Path_Prefix = var.sta_output_adls_file_Path_Prefix
  adls_name                        = var.adls_name
  resource_deploy                  = var.resource_deploy
  resource_depends_on              = var.resource_depends_on
}
