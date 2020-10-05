# Module Machine Learning Workspace

## Description

This module creates an Azure Machine Learning Workspace

## Usage

### Module Definitions

- module location : providers/azure/MachineLearningWorkspace

```hcl
module "aml" {
  source = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AzureMachineLearningWorkspace/"
  #source                      = "../../AzureMachineLearningWorkspace/"
  aml_name                    = var.aml_name
  project_resource_group_name = data.azurerm_resource_group.rg.name
  aml_application_insights_id = azurerm_application_insights.aai.id
  aml_key_vault_id            = azurerm_key_vault.akv.id
  aml_storage_account_id      = azurerm_storage_account.asa.id
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  resource_deploy             = var.resource_deploy
  aml_sku_name                = var.aml_sku_name
  aml_friendly_name           = var.aml_friendly_name
  aml_description             = var.aml_description
  aml_container_registry_id   = azurerm_container_registry.acr.id
  aml_identity_type           = var.aml_identity_type
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
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
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "aml_name" {
  type        = string
  description = "(Required) Specifies the name of the Machine Learning Workspace. Changing this forces a new resource to be created."
  default     = ""
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
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "aml_name" {
  type        = string
  description = "(Required) Specifies the name of the Machine Learning Workspace. Changing this forces a new resource to be created."
  default     = ""
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
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "aml_id" {
  value       = module.aml.aml_id
  description = "The ID of the Machine Learning Workspace."
}
output "aml_name" {
  value       = module.aml.aml_name
  description = "The name of the Machine Learning Workspace"
}
output "aml_identity_id" {
  value       = module.aml.aml_identity_id
  description = "The (Client) ID of the Service Principal."
}
output "aml_tenant_id" {
  value       = module.aml.aml_tenant_id
  description = "The ID of the Tenant the Service Principal is assigned in."
}

```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-DV"
  resource_deploy_aas = true
  ```
- example for `p` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-P"
  resource_deploy_aas = true
  ```
