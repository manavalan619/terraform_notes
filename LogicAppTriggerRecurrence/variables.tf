variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Logic App workflow should exist. Changing this forces a new resource to be created."
}
variable "alaw_name" {
  type        = string
  description = "(Required) The name of the Logic App Workflow."
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
variable "resource_index" {
  type        = number
  description = "Resource Index"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
# ==============================================================================
# Logic App Trigger Recurrence - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "alatr_frequency" {
  type        = string
  description = "(Required) Specifies the Frequency at which this Trigger should be run. Possible values include Month, Week, Day, Hour, Minute and Second."
  default     = "Day"
}
variable "alatr_interval" {
  type        = number
  description = "(Required) Specifies interval used for the Frequency, for example a value of 4 for interval and hour for frequency would run the Trigger every 4 hours."
  default     = 4
}
variable "alatr_start_time" {
  type        = string
  description = "(Optional) Specifies the start date and time for this trigger in RFC3339 format."
  default     = "2000-01-02T03:04:05Z"
}
variable "resource_depends_on" {
  type    = any
  default = null
}
