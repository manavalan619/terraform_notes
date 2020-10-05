# variable "resource_depends_on" {
#   type    = any
#   default = null
# }
# ==============================================================================
# Role Assigment - Variables
# ==============================================================================
variable "aad_group_list" {
  type        = list(string)
  description = ""
  default     = []
}
variable "role_scope_ids" {
  type        = list(string)
  description = ""
  default     = []
}
variable "role_definition_name" {
  type        = string
  description = "(Optional) The name of a built-in Role. Changing this forces a new resource to be created. Conflicts with role_definition_id."
  default     = null
}
// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "role_definition_id" {
#   type        = string
#   description = "(Optional) The Scoped-ID of the Role Definition. Changing this forces a new resource to be created. Conflicts with role_definition_name."
#   default     = null
# }
# variable "role_skip_service_principal_aad_check" {
#   type        = bool
#   description = "(Optional) If the principal_id is a newly provisioned Service Principal set this value to true to skip the Azure Active Directory check which may fail due to replication lag. This argument is only valid if the principal_id is a Service Principal identity. If it is not a Service Principal identity it will cause the role assignment to fail. Defaults to false."
#   default     = false
# }

# variable "role_timeouts_create" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when creating the Role Assignment."
#   default     = "30m"
# }
# variable "role_timeouts_update" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when updating Role Assignment."
#   default     = "30m"
# }
# variable "role_timeouts_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving Role Assignment."
#   default     = "5m"
# }
# variable "role_timeouts_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting Role Assignment."
#   default     = "30m"
# }