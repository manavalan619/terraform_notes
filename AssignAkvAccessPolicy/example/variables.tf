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
  description = ""
  default     = ""
}
variable "resource_depends_on" {
  type    = any
  default = null
}