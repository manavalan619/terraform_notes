# Module AddInputEventHubtoStreamAnalytics
`The development of this module is currently in progress`

## Description
This module adds zn Input EventHub to StreamAnalytics

## Usage
### Module Definitions

- module location : providers/azure/AddInputEventHubtoStreamAnalytics

```hcl
  module "sta_inputeventhub" {
  source                                          = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddInputEventHubtoStreamAnalytics/"
  project_resource_group_name                     = var.project_resource_group_name
  sta_name                                        = module.sta.sta_job_name[0]
  aehcg_name                                      = var.aehcg_name
  aeh_name                                        = var.aeh_name
  aehn_name                                       = var.aehn_name
  sta_inputeventhub_name                          = var.sta_inputeventhub_name
  sta_inputeventhub_shared_access_policy_key      = var.sta_inputeventhub_shared_access_policy_key
  sta_inputeventhub_shared_access_policy_name     = var.sta_inputeventhub_shared_access_policy_name
  sta_inputeventhub_serialization_type            = var.sta_inputeventhub_serialization_type
  sta_inputeventhub_serialization_encoding        = var.sta_inputeventhub_serialization_encoding
  resource_deploy                                 = var.resource_deploy
  resource_depends_on                             = var.resource_depends_on
  }

```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group where the Stream Analytics Job exists. Changing this forces a new resource to be created."
}
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
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "resource_depends_on" {
  type    = any
  default = null
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
```


## Outputs
The following variables are available as module outputs variables


```
output "sta_id" {
  value       = module.sta.sta_id
  description = "The ID of the Stream Analytics Job"
}

output "sta_inputeventhub_id" {
  value       = module.sta_inputeventhub.sta_inputeventhub_id
  description = "The ID of the Stream Analytics Stream Input EventHub."
}
```

## Example variables values in env.tfvars for each env
* example for `dv` environment :
    ```hcl
    ```
* example for `p` environment :
    ```hcl
    ```