# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

# ======================================================
# Creates StreamAnalytics Job with Managed Identity
# ======================================================
resource "azurerm_template_deployment" "sta_with_managed_identity" {
  name                = var.sta_with_managed_identity_deployment_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  template_body = file("${path.module}/arm/template.json")
 
  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters = {
    sta_job_name                                 = var.sta_job_name,
    sta_compatibility_level                      = var.sta_compatibility_level,
    sta_data_locale                              = var.sta_data_locale,
    sta_events_late_arrival_max_delay_in_seconds = var.sta_events_late_arrival_max_delay_in_seconds,
    sta_events_out_of_order_max_delay_in_seconds = var.sta_events_out_of_order_max_delay_in_seconds
    sta_events_out_of_order_policy               = var.sta_events_out_of_order_policy,
    sta_output_error_policy                      = var.sta_output_error_policy,
    sta_streaming_units                          = var.sta_streaming_units,
    sta_transformation_query                     = var.sta_transformation_query
  }
 
  deployment_mode = "Incremental"

  count = (var.resource_deploy ? 1 : 0)
  depends_on = [var.resource_depends_on]

}
