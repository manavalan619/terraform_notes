variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the StorageBlob Services Server should be exist. Changing this forces a new resource to be created."
}
variable "asa_name" {
  type        = string
  description = "(Required) The name of the Storage Account where the Container should be created."
}
variable "asc_name" {
  type        = string
  description = "(Required) The name of the Container which should be created within the Storage Account."
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
  description = "Resource index"
}
# ==============================================================================
# ASB Variables
# ==============================================================================
variable "asb_type" {
  type        = string
  description = "(Required) The type of the storage blob to be created. Possible values are Append, Block or Page."
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "asb_size" {
#   type        = number
#   description = "(Optional) Used only for page blobs to specify the size in bytes of the blob to be created. Must be a multiple of 512."
#   default     = 0
# }
# variable "asb_access_tier" {
#   type        = string
#   description = "(Optional) The access tier of the storage blob. Possible values are Archive, Cool and Hot."
# }
# variable "asb_content_type" {
#   type        = string
#   description = "(Optional) The content type of the storage blob. Cannot be defined if source_uri is defined."
#   default     = "application/octet-stream"
# }
# variable "asb_source" {
#   type        = string
#   description = "(Optional) An absolute path to a file on the local system. This field cannot be specified for Append blobs and cannot be specified if source_content or source_uri is specified."
# }
# variable "asb_source_content" {
#   type        = string
#   description = "(Optional) The content for this blob which should be defined inline. This field can only be specified for Block blobs and cannot be specified if source or source_uri is specified."
# }
# variable "asb_source_uri" {
#   type        = string
#   description = "(Optional) The URI of an existing blob, or a file in the Azure File service, to use as the source contents for the blob to be created. "
# }
# variable "asb_parallelism" {
#   type        = string
#   description = "(Optional) The number of workers per CPU core to run for concurrent uploads."
# }
# variable "asb_metadata" {
#   type        = string
#   description = "(Optional) A map of custom blob metadata."
# }
# variable "asb__timesout_create" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when creating the CosmosDB Mongo Database."
#   default     = "30m"
# }
# variable "asb__timesout_update" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when updating the CosmosDB Mongo Database."
#   default     = "30m"
# }
# variable "asb__timesout_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving the CosmosDB Mongo Database."
#   default     = "5m"
# }
# variable "asb__timesout_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting the CosmosDB Mongo Database."
#   default     = "30m"
# }
