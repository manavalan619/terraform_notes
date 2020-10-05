variable "resource_depends_on" {
  type    = any
  default = null
}
# variable "resource_deploy" {
#   type        = bool
#   description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
#   default     = true
# }
# ==============================================================================
# Key Vault Access Policy - Variables
# ==============================================================================
variable "akv_access_policy_key_vault_id" {
  type        = string
  description = "(Required) Specifies the id of the Key Vault resource. Changing this forces a new resource to be created."
}
variable "akv_access_policy_object_ids" {
  type        = list(string)
  description = "(Required) The list of object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created."
  default     = []
}
variable "akv_access_policy_security_level" {
  type        = string
  description = "(Required) It will be : Owner, Contributor or Reader"
  default     = ""
}

variable "akv_access_policy_secret_permissions" {
  type        = map
  description = "(Required) List of secret permissions, must be one or more"
  default = {
    Owner       = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
    Contributor = ["get", "list", "set"]
    Reader      = ["get", "list"]
  }
}

variable "akv_access_policy_key_permissions" {
  type        = map
  description = "(Required) List of key permissions, must be one or more"
  default = {
    Owner       = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
    Contributor = ["create", "decrypt", "encrypt", "get", "list", "sign", "unwrapKey", "update", "verify", "wrapKey"]
    Reader      = ["decrypt", "get", "list", "unwrapKey", "verify"]
  }
}

variable "akv_access_policy_certificate_permission" {
  type        = map
  description = "(Required) List of certificate permissions, must be one or more"
  default = {
    Owner       = ["backup", "create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "restore", "setissuers", "update"]
    Contributor = ["create", "get", "list", "getissuers", "listissuers", "setissuers", "update"]
    Reader      = ["get", "list", "getissuers", "listissuers"]
  }
}

# variable "provider" {
#   type        = string
#   default     = "azurerm"
# }
// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "akv_access_policy_application_id" {
#   type        = string
#   description = "(Optional) The object ID of an Application in Azure Active Directory."
#   default     = null
# }
# variable "akv_access_policy_storage_permissions" {
#   type        = list(string)
#   description = "(Optional) List of storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update."
#   default     = null
# }
