# ==============================================================================
# DATA - Variables
# ==============================================================================

variable "project_resource_group_name" {
  type        = string
  description = "Required) The name of the resource group in which the EventGrid Domain exists. Changing this forces a new resource to be created."
}

variable "asa_name" {
  type        = string
  description = "Name of the Storage Account"
}


variable "asq_name" {
  type        = string
  description = "(Required) Specifies the Name of the  Stoarge Queue."
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

variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
# ==============================================================================
#   EventGrid Event Subscription - Variables
# ==============================================================================

variable "aeges_event_delivery_schema" {
  type        = string
  description = " (Optional) Specifies the event delivery schema for the event subscription. Possible values include: EventGridSchema, CloudEventSchemaV1_0, CustomInputSchema. Defaults to EventGridSchema. Changing this forces a new resource to be created."
}

variable "aeges_subject_begins_with" {
  type        = string
  description = "(Optional) A string to filter events for an event subscription based on a resource path prefix."
}

variable "aeges_subject_ends_with" {
  type        = string
  description = "(Optional) A string to filter events for an event subscription based on a resource path suffix."
}

variable "aeges_max_delivery_attempts" {
  type        = number
  description = "(Required) Specifies the maximum number of delivery retry attempts for events."
}

variable "aeges_event_time_to_live" {
  type        = number
  description = "(Required) Specifies the time to live (in minutes) for events."
}
