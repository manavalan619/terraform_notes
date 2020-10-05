
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Data Factory."
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
  description = "Resource Index"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
# ==============================================================================
# Data Factory - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "resource_deploy_integration_runtime" {
  type        = bool
  description = "Set to true if linked intergation runtime should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "vsts_configuration" {
  description = ""
  type = object({
    account_name    = string
    branch_name     = string
    project_name    = string
    repository_name = string
    root_folder     = string
    tenant_id       = string
  })
  default = null
}
