# Create Stream Analytics Service
module "sta" {
  source                                       = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StreamAnalytics/"
  project_resource_group_name                  = var.project_resource_group_name
  sta_name                                     = var.sta_name
  sta_output_error_policy                      = var.sta_output_error_policy
  sta_events_out_of_order_policy               = var.sta_events_out_of_order_policy
  sta_events_out_of_order_max_delay_in_seconds = var.sta_events_out_of_order_max_delay_in_seconds
  sta_events_late_arrival_max_delay_in_seconds = var.sta_events_late_arrival_max_delay_in_seconds
  sta_streaming_units                          = var.sta_streaming_units
  sta_transformation_query                     = var.sta_transformation_query
}
