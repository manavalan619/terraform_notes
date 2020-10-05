variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the StreamAnalytics Services Server should be exist. Changing this forces a new resource to be created."
}

# ==============================================================================
# STA Variables
# ==============================================================================

variable "sta_name" {
  type = string
}
variable "sta_compatibility_level" {
  type = string
}
variable "sta_streaming_units" {
  type = number
}
variable "sta_data_locale" {
  type = string
}
variable "sta_events_late_arrival_max_delay_in_seconds" {
  type = number
}
variable "sta_events_out_of_order_max_delay_in_seconds" {
  type = number
}
variable "sta_events_out_of_order_policy" {
  type = string
}
variable "sta_output_error_policy" {
  type = string
}
variable "sta_transformation_query" {
  type = string
}
