# Module VirtualNetworkPeering

`The development of this module is currently in progress`

## Description

This module manages a virtual network peering which allows resources to access other resources in the linked virtual network.

## Usage

### Module Definitions

- module location : providers/azure/VirtualNetworkPeering

  ```hcl
  module "avnp" {
  source                            = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/VirtualNetworkPeering"
  project_resource_group_name       = var.project_resource_group_name
  avnet1_name                       = var.avnet1_name
  avnet2_name                       = var.avnet2_name
  avnp_name                         = var.avnp_name
  avnp_allow_virtual_network_access = var.avnp_allow_virtual_network_access
  avnp_allow_forwarded_traffic      = var.avnp_allow_forwarded_traffic
  avnp_allow_gateway_transit        = var.avnp_allow_gateway_transit
  avnp_use_remote_gateways          = var.avnp_use_remote_gateways
  resource_deploy                   = var.resource_deploy
  }
  ```

````

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
}
variable "avnet1_name" {
  type        = string
  description = "Specifies the name of the Virtual Network."
}
variable "avnet2_name" {
  type        = string
  description = "Specifies the name of the Virtual Network."
}
variable "avnp_name" {
  type        = string
  description = "(Required) The name of the virtual network peering. Changing this forces a new resource to be created."
}
variable "avnp_allow_virtual_network_access" {
  type        = bool
  description = "(Optional) Controls if the VMs in the remote virtual network can access VMs in the local virtual network."
  default     = true
}
variable "avnp_allow_forwarded_traffic" {
  type        = bool
  description = "(Optional) Controls if forwarded traffic from VMs in the remote virtual network is allowed."
  default     = false
}
variable "avnp_allow_gateway_transit" {
  type        = bool
  description = "(Optional) Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
  default     = false
}
variable "avnp_use_remote_gateways" {
  type        = bool
  description = "(Optional) Controls if remote gateways can be used on the local virtual network."
  default     = false
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
````

## Outputs

The following variables are available as module outputs variables

```hcl
output "avnp_id" {
  value       = module.avnp.avnp_id
  description = "The ID of the Virtual Network Peering."
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-DV"
  ```
- example for `p` environment :
  ```hcl
  project_resource_group_name  = "RG-TOTAL-WU-GEORGE-P"
  ```
