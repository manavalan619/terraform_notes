variable "project_resource_group_name" {
  type        = string
  description = "Ressources group name"
}
variable "resource_depends_on" {
  type    = any
  default = null
}

# ==============================================================================
# Azure Eventhub - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "aeh_name" {
  type        = string
  description = "Required Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created."
  default     = "myeventhub"
}
variable "aehn_name" {
  type        = string
  description = "(Required) Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created."
}
variable "aeh_partition_count" {
  type        = number
  description = "Required Specifies the current number of shards on the Event Hub. Changing this forces a new resource to be created"
  default     = 2
}
variable "aeh_message_retention" {
  type        = number
  description = "Required Specifies the number of days to retain the events for this Event Hub. Needs to be between 1 and 7 days; or 1 day when using a Basic SKU for the parent EventHub Namespace."
  default     = 7
}

// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "aeh_capture_descr_enabled" {
#   type        = bool
#   description = "(Required) Specifies if the Capture Description is Enabled."
# }
# variable "aeh_capture_descr_encoding" {
#   type        = string
#   description = "(Required) Specifies the Encoding used for the Capture Description. Possible values are Avro and AvroDeflate."
#   default     = "Avro"
# }
# variable "aeh_capture_descr_interval_in_seconds" {
#   type        = string
#   description = "(Optional) Specifies the time interval in seconds at which the capture will happen. Values can be between 60 and 900 seconds. Defaults to 300 seconds."
#   default     = "300s"
# }
# variable "aeh_capture_descr_size_limit_in_bytes" {
#   type        = number
#   description = "(Optional) Specifies the amount of data built up in your EventHub before a Capture Operation occurs. Value should be between 10485760 and 524288000 bytes. Defaults to 314572800 bytes."
#   default     = 314572800
# }
# variable "aeh_capture_descr_skip_empty_archives" {
#   type        = bool
#   description = "(Optional) Specifies if empty files should not be emitted if no events occur during the Capture time window. Defaults to false"
#   default     = false
# }
# variable "aeh_capture_destination_name" {
#   type        = string
#   description = "(Required) The Name of the Destination where the capture should take place. At this time the only supported value is EventHubArchive.AzureBlockBlob."
# }
# variable "aeh_capture_destination_archive_name_format" {
#   type        = string
#   description = "The Blob naming convention for archiving. e.g. {Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}. Here all the parameters (Namespace,EventHub .. etc) are mandatory irrespective of order"
# }
# variable "aeh_capture_destination_blob_container_name" {
#   type        = string
#   description = "(Required) The name of the Container within the Blob Storage Account where messages should be archived."
# }
# variable "aeh_capture_destination_storage_account_id" {
#   type        = string
#   description = "(Required) The ID of the Blob Storage Account where messages should be archived."
# }
