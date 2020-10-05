
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Data Factory."
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
# variable "resource_index" {
#   type        = string
#   description = "Resource Index"
# }

# ==============================================================================
# Data Factory - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "resource_deploy_integration_runtime" {
  type        = bool
  description = "Set to true if linked intergation runtime should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
variable "shared_adf_name" {
  type        = map
  description = "Azure Data Factory name having the shared integration runtime"
  default = {
    TGS = {
      P  = "adf-p-we-aj16w",
      HP = "adf-hp-we-pj67l"
    },
    HD = {
      P  = "adf-p-we-is71a",
      HP = "adf-hp-we-wh76h"
    },
    GRP = {
      P  = "adf-p-we-kr53f",
      HP = "adf-hp-we-wr68k"
    },
    MS = {
      P  = "adf-p-we-pv22m",
      HP = "adf-hp-we-xh31t"
    },
    EP = {
      P  = "adf-p-we-uw30m",
      HP = "adf-hp-we-kx63a"
    },
    RC = {
      P  = "adf-p-we-hx72p",
      HP = "adf-hp-we-pj75g"
    }
  }
}

variable "vsts_configuration" {
  description = ""
  type = object({
    account_name    = string
    branch_name     = string
    project_name    = string
    repository_name = string
    root_folder     = string
    tenant_id       = string
  })
  default = null
}