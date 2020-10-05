variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the EventHub Consumer Group's grandparent Namespace exists. "
}
variable "aehn_name" {
  type        = string
  description = "(Required) Specifies the name of the grandparent EventHub Namespace. Changing this forces a new resource to be created."
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
  type        = string
  description = "Resource index"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
}
# ==============================================================================
# EventHub Namespace Consumer Group - Variables
# ==============================================================================
variable "aehcg_namespace_name" {
  type        = string
  description = "(Required) Specifies the name of the grandparent EventHub Namespace. Changing this forces a new resource to be created."
}
variable "aehcg_eventhub_name" {
  type        = string
  description = "(Required) Specifies the name of the EventHub. Changing this forces a new resource to be created."
}
variable "aehcg_user_metadata" {
  type        = string
  description = "(Optional) Specifies the user metadata."
}
variable "resource_depends_on" {
  type    = any
  default = null
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
