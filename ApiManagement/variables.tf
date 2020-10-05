variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the  API Management Service should be exist."
}
variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}
variable "project_name" {
  type        = string
  description = "Project name"
}
variable "short_project_name" {
  type        = string
  description = "Project name"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
variable "resource_depends_on" {
  type    = any
  default = null
}
# ======================================================
# APIM variables
# ======================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "apim_publisher_name" {
  type        = string
  description = "(Required) The name of publisher/company."
}
variable "apim_publisher_email" {
  type        = string
  description = "(Required) The email of publisher/company."
}
variable "apim_sku_name" {
  type        = string
  description = "(Required) sku_name is a string consisting of two parts separated by an underscore(_). The fist part is the name, valid values include: Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
}
variable "apim_xml_content" {
  type        = string
  description = "(Optional) The XML Content for Policy block."
}
variable "apim_identity_ids" {
  type        = list(string)
  description = "(Optional) A list of IDs for User Assigned Managed Identity resources to be assigned."
}
variable "apim_vnet_type" {
  type        = string
  description = ""  
}
variable "apim_vnet_configuration_subnet_id" {
  type        = string
  description = "(Required) The subnetID that will be used for the APIM."  
}


// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "apim_xml_link" {
#   type        = string
#   description = "(Optional) A link to an API Management Policy XML Document, which must be publicly available."
# }
# variable "apim_type" {
#   type        = string
#   description = "(Required) Specifies the type of Managed Service Identity that should be configured on this API Management Service. At this time the only supported value isSystemAssigned."
# }
# variable "additional_location" {
#   type        = string
#   description = "(Required) The name of the Azure Region in which the API Management Service should be expanded to."
# }
# variable "sign_in" {
#   type        = bool
#   description = "(Required) Should anonymous users be redirected to the sign in page?"
#   default     = true
# }
# variable "sign_up" {
#   type        = bool
#   description = "(Required) Can users sign up on the development portal?"
#   default     = true
# } 
# variable "apim_enabled" {
#   type        = bool
#   description = "(Required) Should Terms of Service be displayed during sign up?."
#   default     = true
# }
# variable "apim_consent_required" {
#   type        = bool
#   description = "(Required) Should the user be asked for consent during sign up?"
#   default     = true
# }
# variable "apim_text" {
#   type        = bool
#   description = " (Required) The Terms of Service which users are required to agree to in order to sign up."
#   default     = true
# }
