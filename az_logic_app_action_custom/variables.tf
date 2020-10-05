# ==============================================================================
# Data Variables
# ==============================================================================

variable "alaw_name" {
  type        = string
  description = "(Required) The name of the Logic App Workflow."
}

# ==============================================================================
#  Local Variables
# ==============================================================================

variable "assie_rgName" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Logic App Workflow should be created. Changing this forces a new resource to be created."
}

variable "assie_rgTags" {
  type = object({
    Environment     = string
    ApplicationName = string
    ApplicationCode = string
    Branch          = string
    Exploitation    = string
    SecurityLevel   = string
  })
  description = "(optional)Default resource group name  or Logic App Workflow will be created in."
}

variable "module_alaacIndex" {
  type        = string
  description = "Module Index for Logic App Action Custom"
  default     = "01"
}


# ==============================================================================
# Logic App Action Custom - Variables
# ==============================================================================

variable "module_create" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "module_alaaBody" {
  type        = string
  description = "(Required) Specifies the JSON Blob defining the Body of this Custom Action."
}

variable "resource_depends_on" {
  type    = any
  default = null
}
