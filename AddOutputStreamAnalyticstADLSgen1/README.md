# Module AddOutputStreamAnalyticstADLSgen1

`The development of this module is currently in progress`

## Description

This module manages a Stream Analytics Stream Output ADLS gen1.

## Usage

### Module Definitions

- module location : providers/azure/AddOutputStreamAnalyticstADLSgen1

```hcl
module "sta_adls_output" {
  source                           = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddOutputStreamAnalyticstADLSgen1/"
  project_resource_group_name      = var.project_resource_group_name
  rg_tf_name                       = var.rg_tf_name
  akv_tf_name                      = var.akv_tf_name
  sta_adls_output_deployment_name  = var.sta_adls_output_deployment_name
  sta_job_name                     = var.sta_job_name
  sta_output_adls_name             = var.sta_output_adls_name
  sta_output_adls_file_Path_Prefix = var.sta_output_adls_file_Path_Prefix
  adls_name                        = var.adls_name
  resource_deploy                  = var.resource_deploy
  resource_depends_on              = var.resource_depends_on
}

```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the template deployment."
}
variable "akv_tf_name" {
  type        = string
  description = "Azure Key Vault terraform name : to get the Terraform SP Sercet"
}
variable "sta_adls_output_deployment_name" {
  type        = string
  description = "The name Azure Deployement"
}
variable "sta_job_name" {
  type        = string
  description = "The name of the Stream Analytics Job."
}
variable "sta_output_adls_name" {
  type        = string
  description = "The name of the Stream Analytics ADLS output."
}
variable "sta_output_adls_file_Path_Prefix" {
  type        = string
  description = "ADLS output path"
}
variable "adls_name" {
  type        = string
  description = "ADLS name"
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "resource_depends_on" {
  type    = any
  default = null
}
variable "rg_tf_name" {
  type        = string
  description = "Resource group terraform name (to get the SP Secret)"
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "sta_adls_output_id" {
  value       = module.sta_adls_output.sta_adls_output_id
  description = "The ID of the Stream Analytics ADLS output."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-DV"
  ```

````

- example for `p` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-P"
  ```
````
