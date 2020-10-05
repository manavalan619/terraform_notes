# ===============================================
# Data sources
# ===============================================

# Create Stream Analytics Service
module "sta" {
  source                                       = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StreamAnalytics/"
  project_resource_group_name                  = var.project_resource_group_name
  project_name                                 = var.project_name
  short_project_name                           = var.short_project_name
  location_code                                = var.location_code
  env_code                                     = var.env_code
  sta_output_error_policy                      = var.sta_output_error_policy
  sta_events_out_of_order_policy               = var.sta_events_out_of_order_policy
  sta_events_out_of_order_max_delay_in_seconds = var.sta_events_out_of_order_max_delay_in_seconds
  sta_events_late_arrival_max_delay_in_seconds = var.sta_events_late_arrival_max_delay_in_seconds
  sta_streaming_units                          = var.sta_streaming_units
  sta_transformation_query                     = var.sta_transformation_query
  sta_with_managed_identity_deployment_name    = var.sta_with_managed_identity_deployment_name
  resource_deploy                              = var.resource_deploy
  resource_depends_on                          = var.resource_depends_on
}

# ===============================================
# Stream Analytics Stream Input EventHub
# ===============================================

module "sta_inputeventhub" {
  source                                          = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddInputEventHubtoStreamAnalytics/"
  project_resource_group_name                     = var.project_resource_group_name
  sta_name                                        = module.sta.sta_job_name[0]
  aehcg_name                                      = var.aehcg_name
  aeh_name                                        = var.aeh_name
  aehn_name                                       = var.aehn_name
  sta_inputeventhub_name                          = var.sta_inputeventhub_name
  sta_inputeventhub_shared_access_policy_key      = var.sta_inputeventhub_shared_access_policy_key
  sta_inputeventhub_shared_access_policy_name     = var.sta_inputeventhub_shared_access_policy_name
  sta_inputeventhub_serialization_type            = var.sta_inputeventhub_serialization_type
  sta_inputeventhub_serialization_encoding        = var.sta_inputeventhub_serialization_encoding
  resource_deploy                                 = var.resource_deploy
  resource_depends_on                             = var.resource_depends_on
}