# ==============================================================================
# Data - Variables
# ==============================================================================

variable "alaw_name" {
  type        = string
  description = "(Required) The name of the Logic App Workflow."
}

# ==============================================================================
# Local - Variables
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

variable "module_laahIndex" {
  type        = string
  description = "Module Index for Logic App Action Http"
  default     = "01"
}

# ==============================================================================
# Logic App Action Http - Variables
# ==============================================================================
variable "module_create" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "module_laahMethod" {
  type        = string
  description = "(Required) Specifies the HTTP Method which should be used for this HTTP Action. Possible values include DELETE, GET, PATCH, POST and PUT."
}

variable "module_laahUri" {
  type        = string
  description = "(Required) Specifies the URI which will be called when this HTTP Action is triggered."
}

variable "module_laahBody" {
  type        = string
  description = "(Optional) Specifies the HTTP Body that should be sent to the uri when this HTTP Action is triggered."
}

variable "module_laahHeaders" {
  type        = map
  description = "(Optional) Specifies a Map of Key-Value Pairs that should be sent to the uri when this HTTP Action is triggered."
}

variable "resource_depends_on" {
  type    = any
  default = null
}
