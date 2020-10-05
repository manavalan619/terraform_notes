# Module IotHubFallBackRoute
`The development of this module is currently in progress`

## Description
This module creates an Azure IotHubFallBackRoute

## Usage
### Module Definitions

- module location : providers/azure/IotHubFallBackRoute

```hcl
module "aiothfbr" {
  source                      = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/IotHubFallBackRoute/"
  project_resource_group_name = var.project_resource_group_name
  asa_name                    = module.asa.asa_name[0]
  ascn_name                   = module.ascn.ascn_name[0]
  aioth_name                  = module.aioth.aioth_name[0]
  aiothfbr_endpoint_names     = module.aiothepsc.aiothepsc_name[0]
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  env_code                    = var.env_code
}
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group under which the IotHub Storage Container Endpoint resource has to be created. Changing this forces a new resource to be created."
}

variable "asa_name" {
  type        = string
  description = "Required Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}

variable "asa_tier" {
  description = "Required Defines the Tier to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
}
variable "asa_replication_type" {
  description = "Required Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  type        = string
}

variable "asa_kind" {
  type        = string
  description = "Optional Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to Storage."
}

variable "asa_enable_https_traffic_only" {
  type        = bool
  description = "Optional Boolean flag which forces HTTPS if enabled"
}

variable "ascn_name" {
  type        = string
  description = "(Required) Specifies the name of the Authorization Rule. Changing this forces a new resource to be created."
}


variable "ascn_container_access_type" {
  type        = string
  description = "(Optional) The Access Level configured for this Container"
  default     = ""
}

variable "aioth_sku_name" {
  type        = string
  description = " (Required) The name of the sku. Possible values are B1, B2, B3, F1, S1, S2, and S3."
}

variable "aioth_sku_capacity" {
  type        = string
  description = "(Required) The number of provisioned IoT Hub units."
}

variable "aiothepsc_batch_frequency_in_seconds" {
  type        = number
  description = "(Optional) Time interval at which blobs are written to storage. Value should be between 60 and 720 seconds. Default value is 300 seconds."
  default     = 60
}

variable "aiothepsc_max_chunk_size_in_bytes" {
  type        = number
  description = "(Optional) Maximum number of bytes for each blob written to storage. Value should be between 10485760(10MB) and 524288000(500MB). Default value is 314572800(300MB)."
}

variable "aiothepsc_encoding" {
  type        = string
  description = "(Optional) Encoding that is used to serialize messages to blobs. Supported values are 'avro' and 'avrodeflate'. Default value is 'avro'.   "
}

variable "aiothepsc_file_name_format" {
  type        = string
  description = "(Optional) File name format for the blob. Default format is {iothub}/{partition}/{YYYY}/{MM}/{DD}/{HH}/{mm}. All parameters are mandatory but can be reordered. This attribute is mandatory for endpoint type AzureIotHub.StorageContainer."
}

variable "aiothfbr_condition" {
  type        = string
  description = "(Optional) The condition that is evaluated to apply the routing rule. If no condition is provided, it evaluates to true by default."
  default     = "true"
}

variable "aiothfbr_enabled" {
  type        = bool
  description = "(Required) Used to specify whether the fallback route is enabled."
  default     = true
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
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

variable "resource_index" {
  type        = number
  description = "Resource index for the IoT Hub End point"
}
```


## Outputs
The following variables are available as module outputs variables


```
output "aiothfbr_id" {
  value       = module.aiothfbr.aiothfbr_id
  description = "The ID of the IoTHub Fallback Route."
}

output "asa_primary_blob_connection_string" {
  value       = module.asa.asa_primary_blob_connection_string
  description = "The connection string associated with the primary blob location."
}

output "asa_name" {
  value       = module.asa.asa_name
  description = "The name of storage account."
}

output "ascn_name" {
  value       = module.ascn.ascn_name
  description = "The name of storage container"
}

output "aioth_name" {
  value       = module.aioth.aioth_name
  description = "The Name of the IoTHub."
}

output "aiothepsc_name" {
  value       = module.aiothepsc.aiothepsc_name
  description = "The Name of the IotHub Storage Container Endpoint."
}

output "aiothepsc_id" {
  value       = module.aiothepsc.aiothepsc_id
  description = "The ID of the IoTHub Storage Container Endpoint."
}
```

## Example variables values in env.tfvars for each env
* example for `dv` environment :
    ```hcl
    ```
* example for `p` environment :
    ```hcl
    ```