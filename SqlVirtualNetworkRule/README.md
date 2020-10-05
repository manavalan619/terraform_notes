# Module SqlVirtualNetworkRule

## Description

This module allows to add, update, or remove an Azure SQL server to a subnet of a virtual network.

## Usage

### Module Definitions

- module location : providers/azure/SqlVirtualNetworkRule

```hcl
module "asvnr" {
  source                                     = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/SqlVirtualNetworkRule"
  project_resource_group_name                = var.project_resource_group_name
  avnet_name                                 = var.avnet_name
  subnet_name                                = var.subnet_name
  sqlsrv_name                                = var.sqlsrv_name
  project_name                               = var.project_name
  env_code                                   = var.env_code
  short_project_name                         = var.short_project_name
  resource_deploy                            = var.resource_deploy
  asvnr_ignore_missing_vnet_service_endpoint = var.asvnr_ignore_missing_vnet_service_endpoint
}

```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group where the SQL server resides. Changing this forces a new resource to be created."
}
variable "avnet_name" {
  type        = string
  description = "Specifies the name of the Virtual Network."
}
variable "subnet_name" {
  type        = string
  description = "Specifies the name of the Subnet."
}
variable "sqlsrv_name" {
  type        = string
  description = "The name of the SQL Server."
}
variable "project_name" {
  type        = string
  description = "Project Name"
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
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "asvnr_ignore_missing_vnet_service_endpoint" {
  type        = bool
  description = "(Optional) Create the virtual network rule before the subnet has the virtual network service endpoint enabled."
  default     = false
}
```

## Outputs

The following variables are available as module outputs variables

```
output "asvnr_id" {
  value       = module.asvnr.asvnr_id
  description = "The ID of the SQL virtual network rule."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :

  ```hcl
  project_resource_group_name                = "RG-TOTAL-WU-GEORGE-DV"
  avnet_name                                 = "avnet-dv-test-george"
  ```

- example for `p` environment :
  ```hcl
  project_resource_group_name                = "RG-TOTAL-WU-GEORGE-P"
  avnet_name                                 = "avnet-p-test-george"
  ```
