variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Analysis Services Server should be exist. Changing this forces a new resource to be created."
}
variable "aasp_name" {
  type        = string
  description = "Azure App service plan name"
  default     = ""
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
variable "resource_index" {
  type        = number
  description = "Resource index"
}

variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}

# ==============================================================================
# App Services - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "aas_site_config_dotnet_framework_version" {
  type        = string
  description = "(Optional) The version of the .net framework's CLR used in this App Service. Possible values are v2.0"
  default     = "v2.0"
}
variable "aas_site_config_scm_type" {
  type        = string
  description = "(Optional) The type of Source Control enabled for this App Service."
}
variable "aas_connection_string_name" {
  type        = string
  description = "(Required) The name of the Connection String."
  default     = ""
}
variable "aas_connection_string_type" {
  type        = string
  description = " (Required) The type of the Connection String. Possible values are APIHub, Custom, DocDb, EventHub, MySQL, NotificationHub, PostgreSQL, RedisCache, ServiceBus, SQLAzure and SQLServer."
}
variable "aas_connection_string_value" {
  type        = string
  description = "(Required) The value for the Connection String."
}
