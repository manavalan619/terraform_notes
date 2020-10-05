# Module SqlServerFirewall

## Description
This module is a sub module used by SqlDatabase module.
It creates an Azure SQLDatabase Server Firewall Rule on SqlDatabase.

## Usage
### Module Definitions

- module location : providers/azure/SqlServerFirewall

```hcl
  module "sql_srv_fw" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/SqlServerFirewall/"
  project_resource_group_name = var.project_resource_group_name
  sqlsrv_name                 = var.sqlsrv_name
  sqlsrv_fw_rules             = var.sqlsrv_fw_rules
  resource_deploy             = var.resource_deploy
  resource_depends_on         = var.resource_depends_on
  }
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the sql server."
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
variable "sqlsrv_name" {
  type        = string
  description = "(Required) The name of the SQL Server. This needs to be globally unique within Azure."
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
  default = {}
}
```


## Outputs
The following variables are available as module outputs variables


```
output "sqlsrv_fw_id" {
  value       = module.sql_srv_fw.sqlsrv_fw_id
  description = "SQL Server Firewall ID."
}
```

## Example variables values in env.tfvars for each env
* example for `dv` environment :
    ```hcl
    sqlsrv_ad_login = "devteam-security-group"
    sqlsrv_object_id = "fef69d54-9b12-4fd4-ab9c-b673798bc0fa"
    sqlsrv_administrator_login = "sqlsrv_administrator_login_dv"
    sqlsrv_administrator_password = "4-v3ry-53cr37-p455w0rd"
    sqlsrv_version = "12.0"
    ```

* example for `p` environment :
    ```hcl
    sqlsrv_ad_login = "devteam-security-group"
    sqlsrv_object_id = "fef69d54-9b12-4fd4-ab9c-b673798bc0fa"
    sqlsrv_administrator_login = "sqlsrv_administrator_login_p"
    sqlsrv_administrator_password = "4-v3ry-53cr37-p455w0rd"
    sqlsrv_version = "12.0"
    ```