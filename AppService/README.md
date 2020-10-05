# Module AppService

## Description

This module creates an Azure App Service

## Usage

### Module Definitions

- module location : providers/azure/AppService

```
module "aas" {
  source                                   = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AppService/"
  project_resource_group_name              = var.project_resource_group_name
  aasp_name                                = var.aasp_name
  aas_site_config_dotnet_framework_version = var.aas_site_config_dotnet_framework_version
  aas_site_config_scm_type                 = var.aas_site_config_scm_type
  aas_connection_string_name               = var.aas_connection_string_name
  aas_connection_string_type               = var.aas_connection_string_type
  aas_connection_string_value              = var.aas_connection_string_value
  resource_deploy                          = var.resource_deploy
  project_name                             = var.project_name
  short_project_name                       = var.short_project_name
  env_code                                 = var.env_code
  location_code                            = var.location_code
  resource_index                           = var.resource_index
}


```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```
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
variable "resource_index" {
  type        = number
  description = "Resource index"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
variable "aasp_name" {
  type        = string
  description = "Azure App service plan name"
  default     = ""
}
variable "plan_sku_tier" {
  type        = string
  description = "(Required) Specifies the plan's pricing tier."
}
variable "plan_sku_size" {
  type        = string
  description = "(Required) Specifies the plan's instance size."
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "aas_site_config_dotnet_framework_version" {
  type        = string
  description = "(Optional) The version of the .net framework's CLR used in this App Service. Possible values are v2.0"
  default     = "v2.0"
}
variable "aas_site_config_scm_type" {
  type        = string
  description = "(Optional) The type of Source Control enabled for this App Service."
}
variable "aas_connection_string_name" {
  type        = string
  description = "(Required) The name of the Connection String."
  default     = ""
}
variable "aas_connection_string_type" {
  type        = string
  description = " (Required) The type of the Connection String. Possible values are APIHub, Custom, DocDb, EventHub, MySQL, NotificationHub, PostgreSQL, RedisCache, ServiceBus, SQLAzure and SQLServer."
}
variable "aas_connection_string_value" {
  type        = string
  description = "(Required) The value for the Connection String."
}


```

## Outputs

The following variables are available as module outputs variables

```
output "app_service_id" {
  value       = module.aas.app_service_id
  description = "Analysis App ID."
}
output "aas_default_site_hostname" {
  value       = module.aas.aas_default_site_hostname
  description = "The Default Hostname associated with the App Service."
}
output "aas_outbound_ip_addresses" {
  value       = module.aas.aas_outbound_ip_addresses
  description = "A comma separated list of outbound IP addresses."
}
output "aas_possible_outbound_ip_addresses" {
  value       = module.aas.aas_possible_outbound_ip_addresses
  description = "A comma separated list of outbound IP addresses."
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
