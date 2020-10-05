# Module AddOutputEventHubtoSqlDb
`The development of this module is currently in progress`

## Description
This module adds Output EventHub to SqlDb

## Usage
### Module Definitions

- module location : providers/azure/AddOutputEventHubtoSqlDb

## Usage
### Module Definitions

- module location : providers/azure/FunctionApp

```hcl
  module "sta_outputsqldb" {
  source                                    = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddOutputStreamAnalyticstoSqlDb/"
  project_resource_group_name               = var.project_resource_group_name
  sta_outputsql_name                        = var.sta_outputsql_name
  sta_outputsqldb_stream_analytics_job_name = module.sta.sta_job_name[0]
  sta_outputsqldb_server                    = var.sta_outputsqldb_server
  sta_outputsqldb_user                      = var.sta_outputsqldb_user
  sta_outputsqldb_password                  = var.sta_outputsqldb_password
  sta_outputsqldb_database_name             = var.sta_outputsqldb_database_name
  sta_outputsqldb_table                     = var.sta_outputsqldb_table
  sta_outputsqldb_timeouts_create           = var.sta_outputsqldb_timeouts_create
  sta_outputsqldb_timeouts_update           = var.sta_outputsqldb_timeouts_update
  sta_outputsqldb_timeouts_read             = var.sta_outputsqldb_timeouts_read
  sta_outputsqldb_timeouts_delete           = var.sta_outputsqldb_timeouts_delete
  resource_deploy                           = var.resource_deploy
  resource_depends_on                       = var.resource_depends_on
  }
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the StreamAnalytics Services Server should be exist. Changing this forces a new resource to be created."
}
variable "resource_depends_on" {
  type    = any
  default = null
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "sta_outputsql_name" {
  type        = string
  description = "(Required) The name of the Stream Output. Changing this forces a new resource to be created."
}
variable "sta_outputsqldb_server" {
  type        = string
  description = "(Required) The SQL server url. Changing this forces a new resource to be created."
}
variable "sta_outputsqldb_user" {
  type        = string
  description = "(Required) Username used to login to the Microsoft SQL Server. Changing this forces a new resource to be created."
}
variable "sta_outputsqldb_password" {
  type        = string
  description = "(Required) Password used together with username, to login to the Microsoft SQL Server. Changing this forces a new resource to be created."
}
variable "sta_outputsqldb_table" {
  type        = string
  description = "(Required) Table in the database that the output points to. Changing this forces a new resource to be created."
}
variable "sta_outputsqldb_timeouts_create" {
  type        = string
  description = "(Defaults to 30 minutes) Used when creating the Stream Analytics Output Microsoft SQL Server Database."
  default     = "30m"
}
variable "sta_outputsqldb_timeouts_update" {
  type        = string
  description = "(Defaults to 30 minutes) Used when updating the Stream Analytics Output Microsoft SQL Server Database."
  default     = "30m"
}
variable "sta_outputsqldb_timeouts_read" {
  type        = string
  description = "(Defaults to 5 minutes) Used when retrieving the Stream Analytics Output Microsoft SQL Server Database."
  default     = "5m"
}
variable "sta_outputsqldb_timeouts_delete" {
  type        = string
  description = "(Defaults to 30 minutes) Used when deleting the Stream Analytics Output Microsoft SQL Server Database."
  default     = "30m"
}
variable "sta_outputsqldb_database_name" {
  type        = string
  description = "(Required) The SQL DB Name. Changing this forces a new resource to be created."
}

```


## Outputs
The following variables are available as module outputs variables


```
output "sta_outputsqldb_id" {
  value       = module.sta_outputsqldb.sta_outputsqldb_id
  description = "The ID of the Stream Analytics Output Microsoft SQL Server Database."
}
output "sta_job_id" {
  value       = module.sta.sta_job_id
  description = "The Job ID assigned by the Stream Analytics Job."
}
```

## Example variables values in env.tfvars for each env
- example for `dv` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-DV"
  ```
- example for `p` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-P"
  ```
