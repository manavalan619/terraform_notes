# Module ApiManagement

## Description
This module creates an Azure Api Management

## Usage
### Module Definitions

- module location    : providers/azure/ApiManagement

```hcl
module "apim" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/ApiManagement/"
  project_resource_group_name = var.project_resource_group_name
  apim_publisher_name         = var.apim_publisher_name
  apim_publisher_email        = var.apim_publisher_email
  apim_sku_name               = var.apim_sku_name
  resource_deploy             = var.resource_deploy
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
  apim_xml_content            = var.apim_xml_content
}
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Analysis Services Server should be exist. Changing this forces a new resource to be created."
}

variable "apim_publisher_name" {
  type        = string
  description = "(Required) The name of publisher/company."
}

variable "apim_publisher_email" {
  type        = string
  description = "(Required) The email of publisher/company."
}

variable "apim_sku_name" {
  type        = string
  description = "(Required) sku_name is a string consisting of two parts separated by an underscore(_). The fist part is the name, valid values include: Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
}


variable "apim_xml_content" {
  type        = string
  description = "(Optional) The XML Content for Policy block."
}

variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}
variable "project_name" {
  type        = string
  description = "Project name"
}

variable "short_project_name" {
  type        = string
  description = "Project name"
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
```

## Outputs
The following variables are available as module outputs variables


```
output "apim_id" {
  value       = module.apim.apim_id
  description = "The ID of the API Management Service."
}

output "apim_gateway_regional_url" {
  value       = module.apim.apim_gateway_regional_url
  description = "The Region URL for the Gateway of the API Management Service."
}

output "apim_management_api_url" {
  value       = module.apim.apim_management_api_url
  description = "The URL for the Management API associated with this API Management service."
}

output "apim_portal_url" {
  value       = module.apim.apim_portal_url
  description = "The URL for the Publisher Portal associated with this API Management service."
}
output "apim_public_ip_addresses" {
  value       = module.apim.apim_public_ip_addresses
  description = "The Public IP addresses of the API Management Service."
}

output "apim_scm_url" {
  value       = module.apim.apim_scm_url
  description = "The URL for the SCM (Source Code Management) Endpoint associated with this API Management service."
}
```

## Example variables values in env.tfvars for each env
* example for `dv` environment :
    ```hcl
    rg_name  = "RG-TOTAL-WU-GEORGE-DV"
    aegd_name = "tfex-apimanagement-tf-dv-we-<myProjectName>"
    ```
* example for `p` environment :
    ```hcl
    rg_name  = "RG-TOTAL-WU-GEORGE-P"
    aegd_name = "tfex-apimanagement-tf-p-we-<myProjectName>"   ```
