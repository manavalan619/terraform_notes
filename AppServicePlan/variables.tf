variable "project_resource_group_name" {
  type        = string
  description = "Ressources group name"
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
# ==============================================================================
# App Service Plan - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "aasp_sku_tier" {
  type        = string
  description = "Required Specifies the plan's pricing tier."
}
variable "aasp_sku_size" {
  type        = string
  description = "Required Specifies the plan's instance size."
}
variable "aasp_sku_capacity" {
  type        = number
  description = "(Optional) Specifies the number of workers associated with this App Service Plan."
  default     = 1
}
variable "aasp_kind" {
  type        = string
  description = "Optional The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). types to Windows. Changing this forces a new resource to be created."
  default     = "Windows"
}
variable "aasp_max_elastic_worker_count" {
  type        = number
  description = "The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan."
  default     = 1
}
// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "aasp_app_service_environment_id" {
#   type        = string
#   description = "(Optional) The ID of the App Service Environment where the App Service Plan should be located. Changing forces a new resource to be created."
#   default     = ""
# }
# variable "aasp_reserved" {
#   type        = bool
#   description = "(Optional) Is this App Service Plan Reserved. Defaults to false."
#   default     = false
# }
# variable "aasp_per_site_scaling" {
#   type        = bool
#   description = "(Optional) Can Apps assigned to this App Service Plan be scaled independently? If set to false apps assigned to this plan will scale to all instances of the plan. Defaults to false"
#   default     = false
# }
