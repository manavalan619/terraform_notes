# Module SqlServer

## Description

This module is a sub module used by SqlDatabase module.
It creates an Azure SQLDatabase Server and an Azure SQLDatabase

## Usage

### Module Definitions

- module location : providers/azure/SqlServer

```hcl
module "sql-srv" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/SqlServer/"
  project_resource_group_name = var.project_resource_group_name
  sqlsrv_version              = var.sqlsrv_version
  sqlsrv_ad_login             = var.sqlsrv_ad_login
  sqlsrv_ad_admin_group       = var.sqlsrv_ad_admin_group
  sqlsrv_administrator_login  = var.sqlsrv_administrator_login
  resource_deploy             = var.resource_deploy
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
  location_code               = var.location_code
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Analysis Services Server should be exist. Changing this forces a new resource to be created."
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
variable "sqlsrv_version" {
  type        = string
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
  default     = "12.0"
}
variable "sqlsrv_administrator_login" {
  type        = string
  description = "(Required) The administrator login name for the new server. Changing this forces a new resource to be created."
}
variable "sqlsrv_ad_login" {
  type        = string
  description = "(Required) The login name of the principal to set as the server administrator"
}
variable "sqlsrv_ad_admin_group" {
  type        = string
  description = "(Required) The aad group name to set as the server administrator"
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "sqlsrv_id" {
  value = module.sql-srv.sqlsrv_id
}
output "sqlsrv_fully_qualify_domain_name" {
  value = module.sql-srv.sqlsrv_fully_qualify_domain_name
}
output "sqlsrv_name" {
  value = module.sql-srv.sqlsrv_name

}
output "sqlsrv_password" {
  value = module.sql-srv.sqlsrv_password
  sensitive = true
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :

  ```hcl
  sqlsrv_ad_login = "rg-owner-group"
  sqlsrv_ad_admin_group = "ZG-AZR-TG-PATTERN1-DV-OWNER"
  sqlsrv_version = "12.0"
  ```

- example for `p` environment :
  ```hcl
  sqlsrv_ad_login = "rg-owner-group"
  sqlsrv_ad_admin_group = "ZG-AZR-TG-PATTERN1-P-OWNER"
  sqlsrv_version = "12.0"
  ```
