variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group where the Stream Analytics Job exists. Changing this forces a new resource to be created."
}
variable "sta_name" {
  type        = string
  description = "(Required) The name of the Stream Analytics Job. Changing this forces a new resource to be created."
}
variable "aehcg_name" {
  type        = string
  description = "(Required) The name of an Event Hub Consumer Group that should be used to read events from the Event Hub. Specifying distinct consumer group names for multiple inputs allows each of those inputs to receive the same events from the Event Hub."
}
variable "aeh_name" {
  type        = string
  description = "(Required) The name of the Event Hub."
}
variable "aehn_name" {
  type        = string
  description = "(Required) The namespace that is associated with the desired Event Hub, Service Bus Queue, Service Bus Topic, etc."
}
# ==============================================================================
# Stream Analytics Input EventHub - Variables
# ==============================================================================

variable "sta_inputeventhub_name" {
  type        = string
  description = "(Required) The name of the Stream Input EventHub. Changing this forces a new resource to be created."
}
variable "sta_inputeventhub_shared_access_policy_key" {
  type        = string
  description = "(Required) The shared access policy key for the specified shared access policy."
}
variable "sta_inputeventhub_shared_access_policy_name" {
  type        = string
  description = "(Required) The shared access policy name for the Event Hub, Service Bus Queue, Service Bus Topic, etc."
}
variable "sta_inputeventhub_serialization_type" {
  type        = string
  description = "(Required) The serialization format used for incoming data streams. Possible values are Avro, Csv and Json."
  default     = "json"
}
variable "sta_inputeventhub_serialization_encoding" {
  type        = string
  description = "(Optional) The encoding of the incoming data in the case of input and the encoding of outgoing data in the case of output. It currently can only be set to UTF8."
  default     = "UTF8"
}
# variable "sta_inputeventhub_serialization_field_delimiter" {
#   type        = string
#   description = "(Optional) The delimiter that will be used to separate comma-separated value (CSV) records. Possible values are (space), , (comma), (tab), | (pipe) and ;."
#   default     = ""
# }
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "resource_depends_on" {
  type    = any
  default = null
}

// (Temporary) unmanaged attributes (will be included in the scope later) :
# variable "sta_inputeventhub_timeouts_create" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when creating the EventHub Namespace Authorization Rule."
#   default     = "30m"
# }
# variable "sta_inputeventhub_timeouts_update" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when updating the EventHub Namespace Authorization Rule."
#   default     = "30m"
# }
# variable "sta_inputeventhub_timeouts_read" {
#   type        = string
#   description = "(Defaults to 5 minutes) Used when retrieving the EventHub Namespace Authorization Rule."
#   default     = "5m"
# }
# variable "sta_inputeventhub_timeouts_delete" {
#   type        = string
#   description = "(Defaults to 30 minutes) Used when deleting the EventHub Namespace Authorization Rule."
#   default     = "30m"
# }