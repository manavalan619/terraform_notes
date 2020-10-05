variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Analysis Services Server should be exist. Changing this forces a new resource to be created."
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

# ==============================================================================
# Analysis Services - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "aas_sku" {
  type        = string
  description = "(Required) SKU for the Analysis Services Server. Possible values are: D1, B1, B2, S0, S1, S2, S4, S8 and S9"
  default     = "D1"
}
variable "aas_admin_users" {
  type        = list(string)
  description = "(Optional) List of email addresses of admin users."
  default     = []
}
variable "aas_enable_power_bi_service" {
  type        = bool
  description = "(Optional) Indicates if the Power BI service is allowed to access or not."
  default     = true
}
variable "aas_querypool_connection_mode" {
  type        = string
  description = "(Optional) Controls how the read-write server is used in the query pool. If this values is set to All then read-write servers are also used for queries. Otherwise with ReadOnly these servers do not participate in query operations."
  default     = "ReadOnly"
}
variable "aas_backup_blob_container_uri" {
  type        = string
  description = "(Optional) URI and SAS token for a blob container to store backups."
  default     = null
}

// (Optional) One or more ipv4_firewall_rule block(s) as defined below.
variable "aas_ipv4_firewall_rules" {
  description = "(Optional) One or more ipv4_firewall_rule block(s) as defined below."
  type = list(object({
    name        = string
    range_start = string
    range_end   = string
    })
  )
  default = []
}
