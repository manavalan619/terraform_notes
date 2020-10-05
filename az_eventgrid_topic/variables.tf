# ==============================================================================
# Local - Variables
# ==============================================================================

variable "assie_rgName" {
  type        = string
  description = "(Required) The name of the resource group in which the EventGrid Topic exists. Changing this forces a new resource to be created."
}

variable "assie_rgLocation" {
  type        = string
  description = "(Required) The location/region where the eventGrid topic will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
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
  description = "(optional)Default resource group name  or EventGrid Topic will be created in."
}

variable "module_aegtIndex" {
  type        = string
  description = "Module Index for EventGrid Topic."
  default     = "01"
}


# ==============================================================================
#  EventGrid Topic - Variables
# ==============================================================================

variable "module_create" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
