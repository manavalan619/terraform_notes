variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Analysis Services Server should be exist. Changing this forces a new resource to be created."
}

# ==============================================================================
# aase Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "aase_name" {
  type        = string
  description = "(Required) The name of the app service environment. This needs to be globally unique within Azure."
}

variable "aase_subnet_id" {
  type        = string
  description = "(Required) The ID of the Subnet which the App Service Environment should be connected to. Changing this forces a new resource to be created."
  
}

variable "aase_pricing_tier" {
  type        = string
  description = "(Optional) Pricing tier for the front end instances. Possible values are I1, I2 and I3. Defaults to I1."
  default     = "I1" 
}

variable "aase_front_end_scale_factor" {
  type        = number
  description = "(Optional) Scale factor for front end instances. Possible values are between 5 and 15. Defaults to 15."
  default = 15
}
