# Module LogicAppWorkflow

## Description

This module creates an Azure Logic App Workflow

## Usage

### Module Definitions

- module location : providers/azure/LogicAppWorkflow

```hcl
module "alaw" {
  source                      = "https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/LogicAppWorkflow/"
  project_resource_group_name = var.project_resource_group_name
  resource_deploy             = var.resource_deploy
  alaw_workflow_schema        = var.alaw_workflow_schema
  alaw_workflow_version       = var.alaw_workflow_version
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
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
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
variable "alaw_workflow_schema" {
  type        = string
  description = "(Optional) Specifies the Schema to use for this Logic App Workflow."
  default     = "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json"
}
variable "alaw_workflow_version" {
  type        = string
  description = "(Optional) Specifies the version of the Schema used for this Logic App Workflow. Defaults to 1.0.0.0."
  default     = "1.0.0.0"
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "alaw_id" {
  value       = module.alaw.alaw_id
  description = "The Logic App Workflow ID."
}
output "alaw_name" {
  value       = module.alaw.alaw_name
  description = "The Logic App Workflow Name."
}
output "alaw_access_endpoint" {
  value       = module.alaw.alaw_id
  description = "The Access Endpoint for the Logic App Workflow."
}
output "alaw_connector_endpoint_ip_addresses" {
  value       = module.alaw.alaw_connector_endpoint_ip_addresses
  description = "The list of access endpoint ip addresses of connector."
}
output "alaw_connector_outbound_ip_addresses" {
  value       = module.alaw.alaw_connector_outbound_ip_addresses
  description = "The list of outgoing ip addresses of connector."
}
output "alaw_workflow_endpoint_ip_addresses" {
  value       = module.alaw.alaw_workflow_endpoint_ip_addresses
  description = "The list of access endpoint ip addresses of workflow."
}
output "alaw_workflow_outbound_ip_addresses" {
  value       = module.alaw.alaw_workflow_outbound_ip_addresses
  description = "The list of outgoing ip addresses of workflow."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  rg_name     = "RG-TOTAL-WU-GEORGE-DV"
  ```
- example for `p` environment :
  ```hcl
  rg_name     = "RG-TOTAL-WU-GEORGE-P"
  ```
