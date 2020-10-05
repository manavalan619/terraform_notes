variable "resource_depends_on" {
  type    = any
  default = null
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
# ==============================================================================
# Key Vault Secret - Variables
# ==============================================================================
variable "akv_secret_name" {
  type        = string
  description = "(Required) Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."
}
variable "akv_secret_value" {
  type        = string
  description = "(Required) Specifies the value of the Key Vault Secret."
}
variable "akv_key_vault_id" {
  type        = list(string)
  description = "(Required) Azure Key Vault id where secret will be create and store."
  default     = []
}
variable "akv_secret_content_type" {
  type        = string
  description = "(Optional) Specifies the content type for the Key Vault Secret."
  default     = null
}

// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "akv_secret_not_before_date" {
#   type        = string
#   description = "(Optional) Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')"
#   default     = null
# }
# variable "akv_secret_expiration_date" {
#   type        = string
#   description = "(Optional) Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
#   default     = null
# }