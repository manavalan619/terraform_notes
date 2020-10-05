variable "project_resource_group_name" {
  type = string
  description ="(Required) The name of the Resource Group in which the Key Vault should be exist. Changing this forces a new resource to be created."
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
# LogAnalyticsWorkspace Variables
# ==============================================================================
variable "law_name" {
  type = string
  description = "(Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created."
}
variable "law_sku_name" {
  type = string
  description = "(Required) The SKU (pricing level) of the Log Analytics workspace"
  default     = "PerGB2018"
}
variable "law_retention_in_days" {
  type = string
  description = "(Optional) The retention period for the logs in days"
  default     = 30
}