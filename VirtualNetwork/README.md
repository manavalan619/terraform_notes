# Module VirtualNetwork

`The development of this module is currently in progress`

## Description

This module creates an Virtual Network

## Usage

### Module Definitions

- module location : providers/azure/VirtualNetwork

```hcl
  module "virtual-network" {
  source                      = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/VirtualNetwork/"
  project_resource_group_name = var.project_resource_group_name
  env_code                    = var.env_code
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  location_code               = var.location_code
  avnet_address_space         = var.avnet_address_space
  avnet_dns_servers           = var.avnet_dns_servers
  ddos_protection_plan = ({
    id     = module.network_ddos_protection_plan.andpl_id[0]
    enable = true
  })
  resource_deploy = var.resource_deploy
  }
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Virtual Network should be exist. Changing this forces a new resource to be created."
}

variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
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

variable "avnet_address_space" {
  type        = list(string)
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
}

variable "andpl_name" {
  type        = string
  description = "(Required) Specifies the name of the Network DDoS Protection Plan. Changing this forces a new resource to be created."
}

variable "avnet_dns_servers" {
  type        = list(string)
  description = "(Optional) List of IP addresses of DNS servers."
  default     = []
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "avnet_id" {
  value       = module.virtual-network.avnet_id
  description = "The ID of the virtual network."
}

output "avnet_name" {
  value       = module.virtual-network.avnet_name
  description = "The name of the virtual network."
}

output "avnet_resource_group_name" {
  value       = module.virtual-network.avnet_resource_group_name
  description = "The name of the resource group in which the virtual network is created in."
}

output "avnet_virtual_network_location" {
  value       = module.virtual-network.avnet_virtual_network_location
  description = "the location where the virtual network is created."
}

output "avnet_virtual_network_adress_space" {
  value       = module.virtual-network.avnet_virtual_network_adress_space
  description = "Theadresse space that is used the virtual network."
}

output "avnet_virtual_network_sbnet_blocks" {
  value       = module.virtual-network.avnet_virtual_network_sbnet_blocks
  description = "One or more subnet blocks"
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-DV"
  asa_name = "virtual_network-tf-dv-we-<myProjectName>"
  ```
- example for `p` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-P"
  asa_name = "virtual_network-tf-p-we-<myProjectName>"
  ```