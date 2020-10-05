# ==============================================================================
# Local - Variables
# ==============================================================================

variable "assie_rgName" {
  type        = string
  description = "(Required)The name of the resource group under which the IotHub resource has to be created. Changing this forces a new resource to be created."
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
  description = "(optional) Default resource group name that the IotHub will be created in."
}

variable "assie_rgLocation" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource has to be createc. Changing this forces a new resource to be created."
}

variable "module_create" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "module_iothIndex" {
  type        = string
  description = "Resource Index for the IotHub"
}
# ==============================================================================
# IOTH - Variables
# ==============================================================================

variable "module_iothSkuName" {
  type        = string
  description = "(Required) The name of the sku. Possible values are B1, B2, B3, F1, S1, S2, and S3."
}

variable "module_iothSkuCapacity" {
  type        = string
  description = "(Required) The number of provisioned IoT Hub units."
}