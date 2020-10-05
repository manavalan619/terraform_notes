variable "project_resource_group_name" {
  type = string
  description ="(Required) The name of the Resource Group in which the Key Vault should be exist. Changing this forces a new resource to be created."
}
variable "resource_depends_on" {
  type        = any
  default     = null
}

// variables needed to recombine target resources target names
variable "project_name" {
  type        = string
  description = "Project name"
}
variable "short_project_name" {
  type        = string
  description = "Project name"
}
variable "env_code" {
  type        = string
  description = "logical envs : dv, at, hp, p"
  default     = "dv"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}

# ==============================================================================
# LogAnalyticsSolution Variables
# ==============================================================================
variable "las_workspace_resource_id" {
  description = "(Required) The id of the workspace created for Log Analytics. Changing this forces a new resource to be created."
}
variable "las_workspace_name" {
  description = "(Required) The name of the workspace created for Log Analytics. Changing this forces a new resource to be created."
}
variable "las_solution_name" {
  description = "(Required) The name of the Log Analytics Solution."
  default     = "ContainerInsights"
}
variable "las_plan_publisher_name" {
  description = "(Required) The plan publisher name of the Log Analytics Solution."
  default     = "Microsoft"
}
variable "las_plan_product_name" {
  description = "(Required) The plan product name of the Log Analytics Solution."
  default     = "OMSGallery/ContainerInsights"
}