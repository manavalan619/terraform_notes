variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the template deployment."
}
variable "akv_tf_name" {
  type        = string
  description = "Azure Key Vault terraform name : to get the Terraform SP Sercet"
}

# ==============================================================================
# ADLS in Stream Analytics - Variables 
# ==============================================================================
variable "sta_adls_output_deployment_name" {
  type        = string
  description = "The name Azure Deployement"
}
variable "sta_job_name" {
  type        = string
  description = "The name of the Stream Analytics Job."
}
variable "sta_output_adls_name" {
  type        = string
  description = "The name of the Stream Analytics ADLS output."
}
variable "sta_output_adls_file_Path_Prefix" {
  type        = string
  description = "ADLS output path"
}
variable "adls_name" {
  type        = string
  description = "ADLS name"
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "resource_depends_on" {
  type    = any
  default = null
}
variable "rg_tf_name" {
  type        = string
  description = "Resource group terraform name (to get the SP Secret)"
}
