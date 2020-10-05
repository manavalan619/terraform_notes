# Module StreamAnalytics
`The development of this module is currently in progress`

## Description
This module creates an Azure SteamsAnalytics

## Usage
### Module Definitions

- module location : providers/azure/StreamAnalytics

   ```hcl
    module "sta" {
  source                                       = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/StreamAnalytics/"
  project_resource_group_name                  = var.project_resource_group_name
  sta_name                                     = var.sta_name
  sta_output_error_policy                      = var.sta_output_error_policy
  sta_events_out_of_order_policy               = var.sta_events_out_of_order_policy
  sta_events_out_of_order_max_delay_in_seconds = var.sta_events_out_of_order_max_delay_in_seconds
  sta_events_late_arrival_max_delay_in_seconds = var.sta_events_late_arrival_max_delay_in_seconds
  sta_streaming_units                          = var.sta_streaming_units
  sta_transformation_query                     = var.sta_transformation_query
            }
   ```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```hcl
variable "sta_name" {
  type        = string
  description = "(Required) Specifies the compatibility level for this job - which controls certain runtime behaviors of the streaming job. Possible values are 1.0 and 1.1 ."
  default     = ""
}
variable "sta_compatibility_level" {
  type        = string
  description = "(Required) Specifies the compatibility level for this job - which controls certain runtime behaviors of the streaming job. Possible values are 1.0 and 1.1 ."
  default     = "1.1"
}
variable "sta_streaming_units" {
  type        = number
  description = "(Required) Specifies the number of streaming units that the streaming job uses. Supported values are 1, 3, 6 and multiples of 6 up to 120."
  default     = "3"
}
variable "sta_data_locale" {
  type        = string
  description = "(Optional) Specifies the Data Locale of the Job, which should be a supported .NET Culture."
  default     = "en-GB"
}
variable "sta_events_out_of_order_max_delay_in_seconds" {
  type        = number
  description = "(Optional) Specifies the maximum tolerable delay in seconds where events arriving late could be included. Supported range is -1 (indefinite) to 1814399 (20d 23h 59m 59s). Default is 0."
  default     = "50"
}
variable "sta_events_late_arrival_max_delay_in_seconds" {
  type        = number
  description = "(Optional) Specifies the maximum tolerable delay in seconds where out-of-order events can be adjusted to be back in order. Supported range is 0 to 599 (9m 59s). Default is 5."
  default     = "60"
}
variable "sta_events_out_of_order_policy" {
  type        = string
  description = "(Optional) Specifies the policy which should be applied to events which arrive out of order in the input event stream. Possible values are Adjust and Drop. Default is Adjust."
  default     = "Adjust"
}
variable "sta_output_error_policy" {
  type        = string
  description = "(Optional) Specifies the policy which should be applied to events which arrive at the output and cannot be written to the external storage due to being malformed (such as missing column values, column values of wrong type or size). Possible values are Drop and Stop. Default is Drop."
  default     = "Drop"
}
variable "sta_transformation_query" {
  description = "(Required) Specifies the query that will be run in the streaming job"
}
```


## Outputs

The following variables are available as module outputs variables


```hcl
output "sta_id" {
  value = azurerm_stream_analytics_job.sta.id
}
output "sta_job_id" {
  value = azurerm_stream_analytics_job.sta.job_id
}
```

## Example variables values in env.tfvars for each env
* example for `dv` environment :
  ```hcl
   rg_name  = "RG-TOTAL-WU-GEORGE-DV"
   sta_name = "sta-dv-tf-we-streamanalytics<myProjectName>"
  ```
* example for `p` environment :
  ```hcl
  rg_name  = "RG-TOTAL-WU-GEORGE-P"
  sta_name = "sta-p-tf-we-streamanalytics<myProjectName>"
  ```