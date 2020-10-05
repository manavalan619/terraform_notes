variable "project_resource_group_name" {
  type        = string
  description = "(Required) Specifies the name of the Resource Group in which the Machine Learning Workspace should exist. Changing this forces a new resource to be created."
}

variable "project_name" {
  type        = string
  description = "Project name"
}
variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}
variable "short_project_name" {
  type        = string
  description = "Short Project name"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}

# ==============================================================================
# Machine Learning Workspace - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}



variable "aml_application_insights_id" {
  type        = string
  description = "(Required) The ID of the Application Insights associated with this Machine Learning Workspace. Changing this forces a new resource to be created."
  default     = ""
}

variable "aml_key_vault_id" {
  type        = string
  description = "(Required) The ID of key vault associated with this Machine Learning Workspace. Changing this forces a new resource to be created."
  default     = ""
}

variable "aml_storage_account_id" {
  type        = string
  description = "(Required) The ID of the Storage Account associated with this Machine Learning Workspace. Changing this forces a new resource to be created. NOTE: The account_tier cannot be Premium in order to associate the Storage Account to this Machine Learning Workspace."
  default     = ""
}

variable "aml_identity_type" {
  type        = string
  description = "(Required) An identity block defined below. The Type of Identity which should be used for this Disk Encryption Set. At this time the only possible value is SystemAssigned."
  default     = "SystemAssigned"
}

# Optional variables

variable "aml_container_registry_id" {
  type        = string
  description = "(Optional) The ID of the container registry associated with this Machine Learning Workspace. Changing this forces a new resource to be created. NOTE: The admin_enabled should be true in order to associate the Container Registry to this Machine Learning Workspace."
  default     = null
}

variable "aml_description" {
  type        = string
  description = "(Optional) The description of this Machine Learning Workspace."
  default     = "DataOps automatic description of this Machine Learning Workspace."
}

// variable "aml_discovery_url" {
//   type        = string
//   description = "(Optional) The URL for the discovery service to identify regional endpoints for machine learning experimentation services."
//   default     = null
// }

variable "aml_friendly_name" {
  type        = string
  description = "(Optional) Friendly name for this Machine Learning Workspace."
  default     = "DataOps automatic friendly name"
}

variable "aml_sku_name" {
  type        = string
  description = "(Optional) SKU/edition of the Machine Learning Workspace, possible values are Basic for a basic workspace or Enterprise for a feature rich workspace. Defaults to Basic."
  default     = "Basic"
}
