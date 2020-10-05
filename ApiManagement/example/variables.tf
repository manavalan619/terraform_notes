variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Analysis Services Server should be exist. Changing this forces a new resource to be created."
}


# ======================================================
# APIM variables
# ======================================================
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

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
