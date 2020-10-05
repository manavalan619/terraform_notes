# ==============================================================================
# Role Assigment - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "resource_depends_on" {
  type    = any
  default = null
}
variable "role_principal_id" {
  type        = string
  description = ""
  default     = ""
}
variable "role_scope_id" {
  type        = string
  description = ""
  default     = ""
}
variable "role_definition_name" {
  type        = string
  description = "(Optional) The name of a built-in Role. Changing this forces a new resource to be created. Conflicts with role_definition_id."
  default     = ""
}