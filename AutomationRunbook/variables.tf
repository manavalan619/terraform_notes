variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the Runbook is created. Changing this forces a new resource to be created."
}

variable "aaa_name" {
  type        = string
  description = "(Required) The name of the automation account in which the Runbook is created. Changing this forces a new resource to be created."
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
# Automation Runbook Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "aar_log_verbose" {
  type        = string
  description = "(Required) Verbose log option."
}

variable "aar_log_progress" {
  type        = string
  description = "(Required) Progress log option."
}

variable "aar_description" {
  type        = string
  description = "(Optional) A description for this credential."
  default     = ""
}
variable "aar_runbook_type" {
  type        = string
  description = "(Optional) A description for this credential."
  default     = ""
}
variable "aar_uri" {
  type        = string
  description = "(Required) The published runbook content link."
}
variable "aar_local_file_name" {
  type        = string
  description = "(Optional) The desired content of the runbook."
  default     = null
}
