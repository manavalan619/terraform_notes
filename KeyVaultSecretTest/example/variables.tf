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