# ==============================================================================
# DATA - Variables
# ==============================================================================

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



# ==============================================================================
# AIOTHEPSC - Variables
# ==============================================================================
variable "aiothepsc_batch_frequency_in_seconds" {
  type        = number
  description = "(Optional) Time interval at which blobs are written to storage. Value should be between 60 and 720 seconds. Default value is 300 seconds."
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

variable "resource_index" {
  type        = number
  description = "Resource index for the IoT Hub End point"
}

variable "short_project_name" {
  type        = string
  description = "Project name"
}

variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}