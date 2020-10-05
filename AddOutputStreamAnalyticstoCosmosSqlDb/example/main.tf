module "darm" {
  source                       = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddOutputStreamAnalyticstoCosmosSqlDb/"
  project_resource_group_name  = var.project_resource_group_name
  arm_template_deployment_name = var.arm_template_deployment_name
  sta_job_name                 = var.sta_job_name
  sta_outputcosmosdb_name      = var.sta_outputcosmosdb_name
  accountId                    = var.accountId
  accountKey                   = var.accountKey
  database                     = var.database
  collectionNamePattern        = var.collectionNamePattern
  resource_deploy              = var.resource_deploy
  resource_depends_on          = var.resource_depends_on
}