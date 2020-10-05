variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Analysis Services Server should be exist. Changing this forces a new resource to be created."
}

variable "andpl_name" {
  type        = string
  description = "(Required) Specifies the name of the Network DDoS Protection Plan. Changing this forces a new resource to be created."
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
