variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the StreamAnalytics Services Server should be exist. Changing this forces a new resource to be created."
}
variable "resource_depends_on" {
  type    = any
  default = null
}
variable "project_name" {
  type        = string
  description = "Project name"
}
variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}
variable "short_project_name" {
  type        = string
  description = "Short Project name"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "sta_with_managed_identity_deployment_name" {
  type        = string
  description = "The name Azure Deployement"
}
variable "sta_compatibility_level" {
  type        = string
  description = "(Required) Specifies the compatibility level for this job - which controls certain runtime behaviors of the streaming job. Possible values are 1.0 and 1.1 ."
  default     = "1.1"
}
variable "sta_streaming_units" {
  type        = number
  description = "(Required) Specifies the number of streaming units that the streaming job uses. Supported values are 1, 3, 6 and multiples of 6 up to 120."
  default     = 3
}
variable "sta_data_locale" {
  type        = string
  description = "(Optional) Specifies the Data Locale of the Job, which should be a supported .NET Culture."
  default     = "en-GB"
}
variable "sta_events_out_of_order_max_delay_in_seconds" {
  type        = number
  description = "(Optional) Specifies the maximum tolerable delay in seconds where events arriving late could be included. Supported range is -1 (indefinite) to 1814399 (20d 23h 59m 59s). Default is 0."
  default     = 50
}
variable "sta_events_late_arrival_max_delay_in_seconds" {
  type        = number
  description = "(Optional) Specifies the maximum tolerable delay in seconds where out-of-order events can be adjusted to be back in order. Supported range is 0 to 599 (9m 59s). Default is 5."
  default     = 60
}
variable "sta_events_out_of_order_policy" {
  type        = string
  description = "(Optional) Specifies the policy which should be applied to events which arrive out of order in the input event stream. Possible values are Adjust and Drop. Default is Adjust."
  default     = "Adjust"
}
variable "sta_output_error_policy" {
  type        = string
  description = "(Optional) Specifies the policy which should be applied to events which arrive at the output and cannot be written to the external storage due to being malformed (such as missing column values, column values of wrong type or size). Possible values are Drop and Stop. Default is Drop."
  default     = "Drop"
}
variable "sta_transformation_query" {
  type        = string
  description = "(Required) Specifies the query that will be run in the streaming job"
}

# ==============================================================================
# Output SQL DB in Stream Analytics - Variables
# ==============================================================================

variable "sta_outputsql_name" {
  type        = string
  description = "(Required) The name of the Stream Output. Changing this forces a new resource to be created."
}

variable "sta_outputsqldb_server" {
  type        = string
  description = "(Required) The SQL server url. Changing this forces a new resource to be created."
}
variable "sta_outputsqldb_user" {
  type        = string
  description = "(Required) Username used to login to the Microsoft SQL Server. Changing this forces a new resource to be created."
}
variable "sta_outputsqldb_password" {
  type        = string
  description = "(Required) Password used together with username, to login to the Microsoft SQL Server. Changing this forces a new resource to be created."
}
variable "sta_outputsqldb_table" {
  type        = string
  description = "(Required) Table in the database that the output points to. Changing this forces a new resource to be created."
}
variable "sta_outputsqldb_timeouts_create" {
  type        = string
  description = "(Defaults to 30 minutes) Used when creating the Stream Analytics Output Microsoft SQL Server Database."
  default     = "30m"
}
variable "sta_outputsqldb_timeouts_update" {
  type        = string
  description = "(Defaults to 30 minutes) Used when updating the Stream Analytics Output Microsoft SQL Server Database."
  default     = "30m"
}
variable "sta_outputsqldb_timeouts_read" {
  type        = string
  description = "(Defaults to 5 minutes) Used when retrieving the Stream Analytics Output Microsoft SQL Server Database."
  default     = "5m"
}
variable "sta_outputsqldb_timeouts_delete" {
  type        = string
  description = "(Defaults to 30 minutes) Used when deleting the Stream Analytics Output Microsoft SQL Server Database."
  default     = "30m"
}
variable "sta_outputsqldb_database_name" {
  type        = string
  description = "(Required) The SQL DB Name. Changing this forces a new resource to be created."
}