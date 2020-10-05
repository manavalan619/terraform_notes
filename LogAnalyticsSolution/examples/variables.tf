variable "project_resource_group_name" {
  type = string
  description ="(Required) The name of the Resource Group in which the Key Vault should be exist. Changing this forces a new resource to be created."
}

# ==============================================================================
# LogAnalyticsWorkspace Variables
# ==============================================================================
variable "law_name" {
  type = string
  description = "(Required) Specifies the name of the LogAnaluyticsWorkspace. Changing this forces a new resource to be created."
  default     = ""
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