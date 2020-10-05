# Module Network Security Group

## Description

This module Manages a network security group that contains a list of network security rules.

## Usage

### Module Definitions

- module location : providers/azure/NetworkSecurityGroup

```hcl
  module "ansg" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/NetworkSecurityGroup/"
  project_resource_group_name = var.project_resource_group_name
  ansg_name                   = var.ansg_name
  ansg_security_rules         = var.ansg_security_rules
  resource_deploy             = var.resource_deploy
  }
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Network security group should be exist. Changing this forces a new resource to be created."
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}


variable "ansg_name" {
  type        = string
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
}

variable "ansg_security_rules" {
  type = list(object({
    security_rule_name  = string
    security_rule_description  = string #optional(string, null) 
    security_rule_priority = number
    security_rule_direction = string
    security_rule_access = string #is allowed or denied
    security_rule_protocol = string
    security_rule_source_port_range = string
    security_rule_source_port_ranges = list(string)
    security_rule_destination_port_range = string
    security_rule_destination_port_ranges = list(string)
    security_rule_source_address_prefix = string
    security_rule_source_application_security_group_ids = list(string)
    security_rule_source_address_prefixes = list(string)
    security_rule_destination_address_prefix = string
    security_rule_destination_address_prefixes = list(string)
    security_rule_destination_application_security_group_ids = list(string)
  }))
  default = []
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "ansg_id" {
  value       = module.ansg.ansg_id
  description = "The ID of the Network Security Group."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
     rg_name  = "RG-TOTAL-WU-GEORGE-DV"
  ```
- example for `p` environment :
  ```hcl
     rg_name  = "RG-TOTAL-WU-GEORGE-P"
  ```
```
