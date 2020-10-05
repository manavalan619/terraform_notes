# Module AddSqlDatabase

## Description

This module Adds an Azure SQLDatabase to an Azure Server

## Usage

### Module Definitions

- module location : providers/azure/AddSqlDatabase

```hcl
module "asdb" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AddSqlDatabase/"
  project_resource_group_name            = var.project_resource_group_name
  project_name                           = var.project_name
  env_code                               = var.env_code
  short_project_name                     = var.short_project_name
  sqlsrv_name                            = var.sqlsrv_name
  sqldb_edition                          = var.sqldb_edition
  resource_deploy                        = var.resource_deploy
  resource_depends_on                    = var.resource_depends_on
  location_code                          = var.location_code
  sqldb_requested_service_objective_name = var.sqldb_requested_service_objective_name
}

```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the database. This must be the same as Database Server resource group currently."
}
variable "resource_depends_on" {
  type    = any
  default = null
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
}
variable "resource_index" {
  type        = string
  description = "Resource index"
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "sqlsrv_name" {
  type        = string
  description = "(Required) The name of the SQL Server. This needs to be globally unique within Azure."
  default     = ""
}
variable "sqldb_edition" {
  type        = string
  description = "(Optional) The edition of the database to be created. Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web."
  default     = null
}
variable "sqldb_requested_service_objective_name" {
  type        = string
  description = "(Optional) Use requested_service_objective_name or requested_service_objective_id to set the performance level for the database. Valid values are: S0, S1, S2, S3, P1, P2, P4, P6, P11 and ElasticPool"
  default     = null
}
```

## Outputs

The following variables are available as module outputs variables

```
output "sqldb_id" {
  value       = module.asdb.sqldb_id
  description = "SQL DB ID."
}
output "sqldb_creation_date" {
  value       = module.asdb.sqldb_creation_date
  description = "The creation date of the SQL Database."
}
output "sqldb_default_secondary_location" {
  value       = module.asdb.sqldb_default_secondary_location
  description = "The default secondary location of the SQL Database."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :

  ```hcl

  sqldb_name = "mydb-pattern1"
  sqldb_edition = "Standard"
  resource_deploy_sqldb = true
  ```

- example for `p` environment :

  ```hcl
  sqlsrv_ad_login = "rg-owner-group"
  sqlsrv_ad_admin_group = "ZG-AZR-TG-PATTERN1-P-OWNER"
  sqlsrv_version = "12.0"

  sqldb_name = "mydb-pattern2"
  sqldb_edition = "Standard"
  resource_deploy_sqldb = true
  ```
