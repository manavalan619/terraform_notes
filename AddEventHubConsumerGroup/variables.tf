variable "project_resource_group_name" {
  type        = string
  description = "Ressources group name"
}
variable "resource_depends_on" {
  type    = any
  default = null
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
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
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

// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "aehcg_timeouts_create" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when creating the EventHub Consumer Group."
#   default     = "30m"
# }
# variable "aehcg_timeouts_update" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when updating the EventHub Consumer Group."
#   default     = "30m"
# }
# variable "aehcg_timeouts_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving the EventHub Consumer Group."
#   default     = "5m"
# }
# variable "aehcg_timeouts_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting the EventHub Consumer Group."
#   default     = "30m"
# }
