variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Virtual Network should be exist. Changing this forces a new resource to be created."
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}
variable "project_name" {
  type        = string
  description = "Project name"
}
variable "short_project_name" {
  type        = string
  description = "Project name"
}
variable "resource_index" {
  type        = string
  description = "Resource index"
}

# ==============================================================================
# User Assign Identity - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
