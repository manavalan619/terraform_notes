# Module Subnet
`The development of this module is currently in progress`

## Description
This module creates an Azure Subnet 

## Usage
### Module Definitions

- module location : providers/azure/Subnet

```hcl
  module "subnet" {
  source                                                = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/Subnet/"
  project_resource_group_name                           = var.project_resource_group_name
  subnet_name                                           = var.subnet_name
  subnet_virtual_network_name                           = length(module.virtual-network.avnet_name) > 0 ? element(module.virtual-network.avnet_name, 0) : ""
  subnet_address_prefix                                 = var.subnet_address_prefix
  delegations                                           = var.delegations
  subnet_enforce_private_link_endpoint_network_policies = var.subnet_enforce_private_link_endpoint_network_policies
  subnet_enforce_private_link_service_network_policies  = var.subnet_enforce_private_link_service_network_policies
  subnet_service_endpoints                              = var.subnet_service_endpoints
  resource_deploy                                       = var.resource_deploy
  resource_depends_on                                   = module.virtual-network
  }
```

## Inputs
Supported arguments for this module are available in [variables.tf](variables.tf).


```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the subnet should be exist. Changing this forces a new resource to be created."
}

variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "andpl_name" {
  type        = string
  description = "(Required) Specifies the name of the Network DDoS Protection Plan. Changing this forces a new resource to be created."
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

variable "subnet_name" {
  type        = string
  description = "(Required) The name of the subnet. Changing this forces a new resource to be created."
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "(Required) The address prefix to use for the subnet."
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link endpoint on the subnet."
  default     = false
}

variable "subnet_enforce_private_link_service_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link service on the subnet. ."
  default     = false
}

variable "subnet_service_endpoints" {
  type        = list(string)
  description = "(Optional) The list of Service endpoints to associate with the subnet."
  default     = []
}

variable "delegations" {
  description = "(Optional) One or more delegation blocks as defined below."
  type = list(object({
    name = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })

  }))
  default = []
}

variable "avnet_address_space" {
  type        = list(string)
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
}

variable "avnet_ddos_protection_plan" {
  type = object({
    id     = string
    enable = bool
  })
  default = null
}

variable "avnet_dns_servers" {
  type        = list(string)
  description = "(Optional) List of IP addresses of DNS servers."
  default     = []
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link endpoint on the subnet."
  default     = false
}

variable "subnet_enforce_private_link_service_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link service on the subnet. ."
  default     = false
}

variable "subnet_service_endpoints" {
  type        = list(string)
  description = "(Optional) The list of Service endpoints to associate with the subnet."
  default     = []
}
```


## Outputs

The following variables are available as module outputs variables


```hcl
output "subnet_id" {
  value       = module.subnet.subnet_id
  description = "The ID of the subnet."
}

output "subnet_name" {
  value       = module.subnet.subnet_name
  description = "The name of the subnet."
}

output "subnet_resource_group_name" {
  value       = module.subnet.subnet_resource_group_name
  description = "The name of the resource group in which the subnet is created in."
}

output "subnet_virtual_network_name" {
  value       = module.subnet.subnet_virtual_network_name
  description = "The name of the virtual network in which the subnet is created in."
}
```

## Example variables values in env.tfvars for each env
* example for `dv` environment :
  ```hcl
   rg_name  = "RG-TOTAL-WU-GEORGE-DV"
   sta_name = "sta-dv-tf-we-subnet<myProjectName>"
  ```
* example for `p` environment :
  ```hcl
  rg_name  = "RG-TOTAL-WU-GEORGE-P"
  sta_name = "sta-p-tf-we-subnet<myProjectName>"
  ```