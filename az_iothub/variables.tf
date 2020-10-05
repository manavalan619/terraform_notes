# ==============================================================================
# Local - Variables
# ==============================================================================

variable "assie_rgName" {
  type        = string
  description = "(Required)The name of the resource group under which the IotHub resource has to be created. Changing this forces a new resource to be created."
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
  description = "(optional) Default resource group name that the IotHub will be created in."
}

variable "assie_rgLocation" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource has to be createc. Changing this forces a new resource to be created."
}

variable "module_create" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "module_iothIndex" {
  type        = string
  description = "Resource Index for the IotHub"
}
# ==============================================================================
# IOTH - Variables
# ==============================================================================

variable "module_iothSkuName" {
  type        = string
  description = "(Required) The name of the sku. Possible values are B1, B2, B3, F1, S1, S2, and S3."
}

variable "module_iothSkuCapacity" {
  type        = string
  description = "(Required) The number of provisioned IoT Hub units."
}

// (Temporary) unmanaged attributes (will be included in the scope later) :

# variable "module_iothEndpointType" {
#   type        = string
#   description = "(Required) The type of the endpoint. Possible values are AzureIotHub.StorageContainer, AzureIotHub.ServiceBusQueue, AzureIotHub.ServiceBusTopic or AzureIotHub.EventHub."
# }

# variable "module_iothEndpointName" {
#   type        = string
#   description = "(Required) The name of the endpoint. The name must be unique across endpoint types. The following names are reserved: events, operationsMonitoringEvents, fileNotifications and $default."
# }
# variable "module_iothEndpointFrequency" {
#   type        = number
#   description = "Optional) Time interval at which blobs are written to storage. Value should be between 60 and 720 seconds. Default value is 300 seconds. This attribute is mandatory for endpoint type AzureIotHub.StorageContainer."
# }

# variable "module_iothEndpointChunkSize" {
#   type        = number
#   description = "(Optional) Maximum number of bytes for each blob written to storage. Value should be between 10485760(10MB) and 524288000(500MB). Default value is 314572800(300MB). This attribute is mandatory for endpoint type AzureIotHub.StorageContainer."
# }

# variable "module_iothEndpointEncoding" {
#   type        = string
#   description = "(Optional) Encoding that is used to serialize messages to blobs. Supported values are 'avro' and 'avrodeflate'. Default value is 'avro'. This attribute is mandatory for endpoint type AzureIotHub.StorageContainer."
# }

# variable "module_iothEndpointFileNameFormat" {
#   type        = string
#   description = "(Optional) File name format for the blob. Default format is {iothub}/{partition}/{YYYY}/{MM}/{DD}/{HH}/{mm}. All parameters are mandatory but can be reordered. This attribute is mandatory for endpoint type AzureIotHub.StorageContainer."
# }

# variable "module_iothRouteName" {
#   type        = string
#   description = "(Required) The name of the route."
# }

# variable "module_iothRouteSource" {
#   type        = string
#   description = "(Required) The source that the routing rule is to be applied to, such as DeviceMessages. Possible values include: RoutingSourceInvalid, RoutingSourceDeviceMessages, RoutingSourceTwinChangeEvents, RoutingSourceDeviceLifecycleEvents, RoutingSourceDeviceJobLifecycleEvents."
# }
# variable "module_iothRouteCondition" {
#   type        = string
#   description = "(Optional) The condition that is evaluated to apply the routing rule. If no condition is provided, it evaluates to true by default."
# }



# variable "module_iothIpFilterRuleName" {
#   type        = string
#   description = "(Required) The name of the filter."
# }

# variable "module_iothIpFilterRuleIp" {
#   type        = string
#   description = "(Required) The IP address range in CIDR notation for the rule."
# }

# variable "module_iothIpFilterRuleAction" {
#   type        = string
#   description = "(Required) The desired action for requests captured by this rule. Possible values are Accept, Reject"
# }

# variable "module_iothFallbackRouteSource" {
#   type        = string
#   description = "(Optional) The source that the routing rule is to be applied to, such as DeviceMessages. Possible values include: RoutingSourceInvalid, RoutingSourceDeviceMessages, RoutingSourceTwinChangeEvents, RoutingSourceDeviceLifecycleEvents, RoutingSourceDeviceJobLifecycleEvents."
# }

# variable "module_iothFallbackRouteCondition" {
#   type        = string
#   description = "(Optional) The condition that is evaluated to apply the routing rule. If no condition is provided, it evaluates to true by default."
# }

# variable "module_iothFallbackRouteEndpointNames" {
#   type        = string
#   description = "(Optional) The endpoints to which messages that satisfy the condition are routed. Currently only 1 endpoint is allowed."
# }

# variable "aioth_connection_string" {
#   type        = string
#   description = "(Required) The connection string for the Azure Storage account to which files are uploaded."
# }

# variable "aioth_container_name" {
#   type        = string
#   description = "(Required) The name of the root container where you upload files. The container need not exist but should be creatable using the connection_string specified."
# }

# variable "module_iothRouteEndpointNames" {
#   type        = list(string)
#   description = "(Required) The list of endpoints to which messages that satisfy the condition are routed."
# }

# variable "module_iothRouteEnabled" {
#   type        = bool
#   description = "(Required) Used to specify whether a route is enabled."
# }
