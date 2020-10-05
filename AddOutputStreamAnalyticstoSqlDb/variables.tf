variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the StreamAnalytics Services Server should be exist. Changing this forces a new resource to be created."
}
variable "resource_depends_on" {
  type        = any
  default     = null
}

# ==============================================================================
# Stream Analytics Output SQL - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "sta_outputsql_name" {
  type        = string
  description = "(Required) The name of the Stream Output. Changing this forces a new resource to be created."
}
variable "sta_outputsqldb_stream_analytics_job_name" {
  type        = string
  description = "Required) The name of the Stream Analytics Job. Changing this forces a new resource to be created."
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