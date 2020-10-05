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

# ======================================================
# stream analytics output mssql module
# ======================================================


module "sta_outputsqldb" {
  source                                    = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddOutputStreamAnalyticstoSqlDb/"
  project_resource_group_name               = var.project_resource_group_name
  sta_outputsql_name                        = var.sta_outputsql_name
  sta_outputsqldb_stream_analytics_job_name = module.sta.sta_job_name[0]
  sta_outputsqldb_server                    = var.sta_outputsqldb_server
  sta_outputsqldb_user                      = var.sta_outputsqldb_user
  sta_outputsqldb_password                  = var.sta_outputsqldb_password
  sta_outputsqldb_database_name             = var.sta_outputsqldb_database_name
  sta_outputsqldb_table                     = var.sta_outputsqldb_table
  sta_outputsqldb_timeouts_create           = var.sta_outputsqldb_timeouts_create
  sta_outputsqldb_timeouts_update           = var.sta_outputsqldb_timeouts_update
  sta_outputsqldb_timeouts_read             = var.sta_outputsqldb_timeouts_read
  sta_outputsqldb_timeouts_delete           = var.sta_outputsqldb_timeouts_delete
  resource_deploy                           = var.resource_deploy
  resource_depends_on                       = var.resource_depends_on
}