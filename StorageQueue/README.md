# Module StorageQueue

## Description
This module creates an Azure storage queue    

## Usage
### Module Definitions

- StorageQueue module location    : providers/azure/StorageQueue

```hcl

module "asq" {
  source                      = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StorageQueue"
  project_resource_group_name = var.project_resource_group_name
  asa_name                    = length(module.asa.asa_name) > 0 ? element(module.asa.asa_name, 0) : ""
  project_name                = var.project_name
  env_code                    = var.env_code
  short_project_name          = var.short_project_name
  resource_deploy             = var.resource_deploy
  resource_index              = var.resource_index
}
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the storage queue should be exist. Changing this forces a new resource to be created."
}

variable "asa_account_tier" {
  type        = string
  description = "Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  default     = "Standard"
}

variable "asa_account_replication_type" {
  type        = string
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  default     = "LRS"
}

variable "asa_kind" {
  type        = string
  description = "Optional Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to Storage."
}

variable "asa_access_tier" {
  type        = string
  description = "Optional Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot."
  default     = "Hot"
}

variable "asa_enable_https_traffic_only" {
  type        = bool
  description = "Optional Boolean flag which forces HTTPS if enabled"
}

variable "asa_is_hns_enabled" {
  description = "Optional Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2"
  type        = bool
  default     = false
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
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

variable "resource_index" {
  type        = number
  description = "Resource index for the Stoarge Queue"
}
```

## Outputs
The following variables are available as module outputs variables


```
output "asq_id" {
  value       = module.asq.asq_id
  description = "The ID of the Storage Queue."
}

output "asq_name" {
  value       = module.asq.asq_name
  description = "The Name of the Storage Queue."
}
```

## Example variables values in env.tfvars for each env
* example for `dv` environment :
    ```hcl
    rg_name  = "RG-TOTAL-WU-GEORGE-DV"
    aegd_name = "tfex-storagequeue-tf-dv-we-<myProjectName>"
    ```
* example for `p` environment :
    ```hcl
    rg_name  = "RG-TOTAL-WU-GEORGE-P"
    aegd_name = "tfex-storagequeue-tf-p-we-<myProjectName>"  
     ```