# Module SqlDatabase

## Description

This module creates an Azure SQLDatabase Server and an Azure SQLDatabase

## Usage

### Module Definitions

- module location : providers/azure/SqlDatabase

```hcl
module "asdb" {
  source = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/SqlDatabase/"
  //source                                 = "../../SqlDatabase/"
  project_resource_group_name            = data.azurerm_resource_group.rg.name
  sqlsrv_ad_login                        = var.sqlsrv_ad_login
  sqlsrv_ad_admin_group                  = var.sqlsrv_ad_admin_group
  sqlsrv_administrator_login             = var.sqlsrv_administrator_login
  sqlsrv_version                         = var.sqlsrv_version
  sqlsrv_fw_rules                        = var.sqlsrv_fw_rules
  sqldb_edition                          = var.sqldb_edition
  sqldb_requested_service_objective_name = var.sqldb_requested_service_objective_name
  project_name                           = var.project_name
  env_code                               = var.env_code
  short_project_name                     = var.short_project_name
  resource_index                         = var.resource_index
  location_code                          = var.location_code
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the database. This must be the same as Database Server resource group currently."
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
variable "resource_index" {
  type        = string
  description = "Resource Index"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
}
variable "sqlsrv_version" {
  type        = string
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
  default     = "12.0"
}
variable "sqlsrv_administrator_login" {
  type        = string
  description = "(Required) The administrator login name for the new server. Changing this forces a new resource to be created."
  default     = ""
}
variable "sqlsrv_ad_login" {
  type        = string
  description = "(Required) The login name of the principal to set as the server administrator"
  default     = ""
}
variable "sqlsrv_ad_admin_group" {
  type        = string
  description = "(Required) The aad groupb name to set as the server administrator"
  default     = ""
}
variable "resource_deploy_fw" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "sqlsrv_fw_rules" {
  type = map(
    object(
      {
        name     = string
        start_ip = string
        end_ip   = string
      }
    )
  )
  default = null
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
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

```hcl
output "sqlsrv_id" {
  value       = module.asdb.sqlsrv_id
  description = "SQL Server ID."
}

output "sqlsrv_fully_qualify_domain_name" {
  value       = module.asdb.sqlsrv_fully_qualify_domain_name
  description = "SQL Server FQDN."
}

output "sqlsrv_name" {
  value       = module.asdb.sqlsrv_name
  description = "SQL Server Name."
}
output "sqlsrv_password" {
  value       = module.asdb.sqlsrv_password
  sensitive   = true
  description = "SQL Server Password."
}

output "sqlsrv_fw_id" {
  value       = module.asdb.sqlsrv_fw_id
  description = "SQL Server Firewall ID."
}

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
  description = "SQL DB ID."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :

  ```hcl
  sqlsrv_ad_login = "rg-owner-group"
  sqlsrv_ad_admin_group = "ZG-AZR-TG-PATTERN1-DV-OWNER"
  sqlsrv_version = "12.0"

  ```

sqldb_name = "mydb-pattern1"
sqldb_edition = "Standard"
sqldb_requested_service_objective_name = "S0"
resource_deploy_sqldb = true

````

- example for `p` environment :

  ```hcl
  sqlsrv_ad_login = "rg-owner-group"
  sqlsrv_ad_admin_group = "ZG-AZR-TG-PATTERN1-P-OWNER"
  sqlsrv_version = "12.0"

  sqldb_name = "mydb-pattern2"
  sqldb_edition = "Standard"
  sqldb_requested_service_objective_name = "S0"
  resource_deploy_sqldb = true
````
