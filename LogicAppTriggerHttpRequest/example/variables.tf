variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Logic App workflow should exist. Changing this forces a new resource to be created."
}
variable "alaw_name" {
  type        = string
  description = "(Required) The name of the Logic App Workflow."
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
  description = "Resource Index"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
# ==============================================================================
# Logic App Trigger Http Request - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "alathr_schema" {
  type        = string
  description = "(Required) A JSON Blob defining the Schema of the incoming request."
}
variable "alathr_method" {
  type        = string
  description = "(Optional) Specifies the HTTP Method which the request be using. Possible values include DELETE, GET, PATCH, POST or PUT."
  default     = "GET"
}
variable "alathr_relative_path" {
  type        = string
  description = "(Optional) Specifies the Relative Path used for this Request."
}
variable "resource_depends_on" {
  type    = any
  default = null
}
