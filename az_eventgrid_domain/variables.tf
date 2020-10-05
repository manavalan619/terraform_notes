# ==============================================================================
# Local - Variables
# ==============================================================================

variable "assie_rgName" {
  type        = string
  description = "(Required) The name of the resource group in which the EventGrid Domain exists. Changing this forces a new resource to be created."
}

variable "assie_rgLocation" {
  description = "The location/region where the eventgrid domain will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default     = "westeurope"
}

variable "assie_rgTags" {
  type = object({
    Environment     = string
    ApplicationName = string
    ApplicationCode = string
    Branch          = string
    Exploitation    = string
    SecurityLevel   = string
  })
  description = "(optional)Default resource group name  or eventgrid domain will be created in."
}

variable "module_create" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}


variable "module_aegdIndex" {
  type        = string
  description = "Module Index for EventGrid Domain"
  default     = "01"
}
# ==============================================================================
#  EventGrid Topic - Variables
# ==============================================================================

variable "module_aegdInputSchema" {
  type        = string
  description = "(Optional) Specifies the schema in which incoming events will be published to this domain. Allowed values are CloudEventSchemaV1_0, CustomEventSchema, or EventGridSchema. Defaults to eventgridschema. Changing this forces a new resource to be created."
}

variable "module_aegdId" {
  type        = string
  description = "(Optional) Specifies the id of the EventGrid Event to associate with the domain. Changing this forces a new resource to be created."
}

variable "module_aegdTopic" {
  type        = string
  description = "(Optional) Specifies the topic of the EventGrid Event to associate with the domain. Changing this forces a new resource to be created."
}

variable "module_aegdEventType" {
  type        = string
  description = "(Optional) Specifies the event type of the EventGrid Event to associate with the domain. Changing this forces a new resource to be created."
}

variable "module_aegdSubject" {
  type        = string
  description = "(Optional) Specifies the subject of the EventGrid Event to associate with the domain. Changing this forces a new resource to be created."
}


variable "module_aegdDataVersion" {
  type        = string
  description = "(Optional) Specifies the data version of the EventGrid Event to associate with the domain. Changing this forces a new resource to be created."
}
