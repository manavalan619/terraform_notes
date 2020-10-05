# Module Databricks

## Description
This module creates an Azure Databricks Workspace

## Usage
### Module Definitions

- module location : providers/azure/Databricks

```hcl
  module "databx4" {
  source                      = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/Databricks"
  resource_group_name         = data.azurerm_resource_group.project_resource_group.name
  akv_project_name            = var.akv_project_name
  resource_deploy             = var.resource_deploy
  env_code                    = var.env_code
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  adb_sku                     = var.adb_sku
  custom_parameters = ({
    no_public_ip        = var.no_public_ip
    public_subnet_name  = data.azurerm_subnet.public_subnet_name.name
    virtual_network_id  = data.azurerm_virtual_network.avnet.id
    private_subnet_name = data.azurerm_subnet.private_subnet_name.name
  })
  }
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```hcl
variable "project_resource_group_name" {
  type        = string
  description = "Ressources group name"
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
  description = "Project name"
}

variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}

variable "avnet_name" {
  type        = string
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
}

variable "private_subnet_name" {
  type        = string
  description = "(Optional) The name of the Private Subnet within the Virtual Network. Required if virtual_network_id is set."
}

variable "public_subnet_name" {
  type        = string
  description = "(Optional) The name of the Public Subnet within the Virtual Network. Required if virtual_network_id is set."
}

variable "no_public_ip" {
  type        = bool
  description = "(Optional) Are public IP Addresses not allowed?"
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "akv_project_name" {
  type        = string
  description = "Azure Key Vault project name : to store the Azure Databricks token"
}
variable "adb_sku" {
  type        = string
  description = "(Required) The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial. Changing this forces a new resource to be created."
  default     = "standard"
}

variable "custom_parameters" {
  description = ""
  type = object({
    no_public_ip        = bool
    public_subnet_name  = string
    private_subnet_name = string
    virtual_network_id  = string
  })
  default = null
}
```

In a common.tf file add this
```
locals {
  adb_target_name           = "adb-${var.target_env}-${var.location_code}-${random_string.suffix.result}"
}
```

## Outputs
The following variables are available as module outputs variables

```hcl
output "adb_id" {
  value       = module.databx4.adb_id
  description = "Databricks Workspace ID."
}
output "adb_name" {
  value       = module.databx4.adb_name
  description = "Databricks Workspace Name."
}
output "adb_managed_resource_group_id" {
  value       = module.databx4.adb_managed_resource_group_id
  description = "The ID of the Managed Resource Group created by the Databricks Workspace."
}
```

## Example variables values in env.tfvars for each env
* example for `dv` environment :
    ```hcl
    rg_tf_name  = "RG-TOTAL-TF-MGT-TG-DV"
    akv_tf_name = "akv-tf-dv-ne-<projectName>"
    adb_edition = "standard"
    resource_deploy_adb = true
    ```
* example for `p` environment :
    ```hcl
    rg_tf_name  = "RG-TOTAL-TF-MGT-TG-P"
    akv_tf_name = "akv-tf-dv-ne-<projectName>"
    adb_edition = "standard"
    resource_deploy_adb = true
    ```