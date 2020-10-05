# ==============================================================================
# DATA - Variables
# ==============================================================================

variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the storage queue should be exist. Changing this forces a new resource to be created."
}

variable "asa_name" {
  type        = string
  description = "(Required) The name of the Storage Account where the Queue should be created."
}

# ==============================================================================
#   Storage Queue - Variables
# ==============================================================================

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
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

variable "resource_index" {
  type        = number
  description = "Resource index for the Stoarge Queue"
}
