# Module AnalysisService

## Description

This module creates an Azure Analysis Service

## Usage

### Module Definitions

- module location : providers/azure/AnalysisService

```hcl
module "aas" {
  resource_deploy               = var.resource_deploy
  source                        = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/AnalysisService"
  project_resource_group_name   = data.azurerm_resource_group.rg.name
  aas_sku                       = var.aas_sku
  aas_admin_users               = var.aas_admin_users
  project_name                  = var.project_name
  env_code                      = var.env_code
  short_project_name            = var.short_project_name
  location_code                 = var.location_code
  aas_enable_power_bi_service   = var.aas_enable_power_bi_service
  aas_querypool_connection_mode = var.aas_querypool_connection_mode
  aas_backup_blob_container_uri = var.aas_backup_blob_container_uri
  aas_ipv4_firewall_rules       = var.aas_ipv4_firewall_rules
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
variable "aas_sku" {
  type        = string
  description = "(Required) SKU for the Analysis Services Server. Possible values are: D1, B1, B2, S0, S1, S2, S4, S8 and S9"
  default     = "D1"
}
variable "aas_admin_users" {
  type        = list(string)
  description = "(Optional) List of email addresses of admin users."
  default     = []
}

// (Temporary) unmanaged attributes (will be included in the scope later) :
variable "aas_enable_power_bi_service" {
  type        = bool
  description = "(Optional) Indicates if the Power BI service is allowed to access or not."
  default     = true
}
variable "aas_querypool_connection_mode" {
  type        = string
  description = "(Optional) Controls how the read-write server is used in the query pool. If this values is set to All then read-write servers are also used for queries. Otherwise with ReadOnly these servers do not participate in query operations."
  default     = "ReadOnly"
}
variable "aas_backup_blob_container_uri" {
  type        = string
  description = "(Optional) URI and SAS token for a blob container to store backups."
  default     = null
}

// (Optional) One or more ipv4_firewall_rule block(s) as defined below.
variable "aas_ipv4_firewall_rules" {
  description = "(Optional) One or more ipv4_firewall_rule block(s) as defined below."
  type = list(object({
    name        = string
    range_start = string
    range_end   = string
    })
  )
  default = []
}

```

## Outputs

The following variables are available as module outputs variables

```hcl
output "aas_id" {
  value       = module.aas.aas_id
  description = "Analysis Service ID."
}
output "aas_server_full_name" {
  value       = module.aas.aas_server_full_name
  description = "Analysis Service Server Full Name."
}

```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  project_resource_group_name   = "RG-TOTAL-WU-GEORGE-DV"
  aas_sku                       = "D1"
  aas_admin_users               = ["george.albert@totalazurecloud.onmicrosoft.com"]
  ```
- example for `p` environment :
  ```hcl
  project_resource_group_name   = "RG-TOTAL-WU-GEORGE-P"
  aas_sku                       = "D1"
  aas_admin_users               = ["george.albert@totalazurecloud.onmicrosoft.com"]
  ```
