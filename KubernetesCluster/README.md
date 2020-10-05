# Module KubernetesCluster

## Description

This module manages a Managed Kubernetes Cluster (also known as AKS / Azure Kubernetes Service)

## Usage

### Module Definitions

- module location : providers/azure/KubernetesCluster

```hcl
module "aks" {
  source                         = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/KubernetesCluster"
  project_resource_group_name    = var.project_resource_group_name
  aks_name                       = var.aks_name
  aks_dns_prefix                 = var.aks_dns_prefix
  aks_version                    = var.aks_version
  aks_rbac_aad_client_app_id     = var.aks_rbac_aad_client_app_id
  aks_rbac_aad_server_app_id     = var.aks_rbac_aad_server_app_id
  aks_rbac_aad_server_app_secret = var.aks_rbac_aad_server_app_secret
  aks_sp_client_id               = var.aks_sp_client_id
  aks_sp_secret                  = var.aks_sp_secret
  aks_agent_count                = var.aks_agent_count
  aks_agent_vm_size              = var.aks_agent_vm_size
  aks_agent_os_disk_size         = var.aks_agent_os_disk_size
  aks_vnet_subnet_id             = var.aks_vnet_subnet_id
  aks_service_cidr               = var.aks_service_cidr
  aks_dns_service_ip             = var.aks_dns_service_ip
  aks_docker_bridge_cidr         = var.aks_docker_bridge_cidr
  resource_depends_on            = var.resource_depends_on
  resource_deploy                = var.resource_deploy
}
```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
variable "project_resource_group_name" {
  type        = string
  description = "(Required) Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
}
variable "aks_name" {
  type        = string
  description = "(Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
}
variable "aks_dns_prefix" {
  type        = string
  description = "(Required) DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
  default     = "aks-dns"
}
variable "aks_version" {
  type        = string
  description = "(Optional) The version of kubernetes."
  default     = "1.16.7" // "1.14.8"
}
variable "aks_rbac_aad_client_app_id" {
  type        = string
  description = "(Required) The Client ID of an Azure Active Directory Application."
}
variable "aks_rbac_aad_server_app_id" {
  type        = string
  description = "(Required) The Server ID of an Azure Active Directory Application."
}
variable "aks_rbac_aad_server_app_secret" {
  type        = string
  description = "(Required) The Server Secret of an Azure Active Directory Application."
}
variable "aks_sp_client_id" {
  type        = string
  description = "(Required) The Client ID for the Service Principal."
}
variable "aks_sp_secret" {
  type        = string
  description = "(Required) The Client Secret for the Service Principal."
}
variable "aks_agent_count" {
  type        = number
  description = "The number of agent nodes for the cluster."
  default     = 3
}
variable "aks_agent_vm_size" {
  type        = string
  description = "The size of the Virtual Machine."
  default     = "Standard_D3_v2"
}
variable "aks_agent_os_disk_size" {
  type        = number
  description = "Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 0 to 1023. Specifying 0 applies the default disk size for that agentVMSize."
  default     = 40
}
variable "aks_vnet_subnet_id" {
  type        = string
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
}
variable "aks_service_cidr" {
  type        = string
  description = "A CIDR notation IP range from which to assign service cluster IPs."
  default     = "10.0.0.0/16"
}
variable "aks_dns_service_ip" {
  type        = string
  description = "Containers DNS server IP address."
  default     = "10.0.0.10"
}
variable "aks_docker_bridge_cidr" {
  type        = string
  description = "A CIDR notation IP for Docker bridge."
  default     = "172.17.0.1/16"
}
variable "resource_depends_on" {
  type    = any
  default = null
}
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "aks_cluster_id" {
  description = "The Kubernetes Managed Cluster ID."
  value       = module.aks.aks_cluster_id
}
output "aks_cluster_fqdn" {
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
  value       = module.aks.aks_cluster_fqdn
}
output "aks_cluster_private_fqdn" {
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
  value       = module.aks.aks_cluster_private_fqdn
}
output "aks_kube_admin_config" {
  description = "A kube_admin_config block as defined below. This is only available when Role Based Access Control with Azure Active Directory is enabled."
  value       = module.aks.aks_kube_admin_config
}
output "aks_kube_admin_config_raw" {
  description = "Raw Kubernetes config for the admin account to be used by kubectl and other compatible tools. This is only available when Role Based Access Control with Azure Active Directory is enabled."
  value       = module.aks.aks_kube_admin_config_raw
}
output "aks_kube_config" {
  description = "A kube_config block as defined below."
  value       = module.aks.aks_kube_config
}
output "aks_kube_config_raw" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools"
  value       = module.aks.aks_kube_config_raw
}
output "aks_node_resource_group" {
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
  value       = module.aks.aks_node_resource_group
}
output "aks_kubelet_identity" {
  description = "A kubelet_identity block as defined below."
  value       = module.aks.aks_kubelet_identity
}
```

## Example variables values in env.tfvars for each env

- example for `dv` environment :

```
project_resource_group_name="RG-TOTAL-WU-GEORGE-DV"
```

- example for `p` environment :

```
project_resource_group_name="RG-TOTAL-WU-GEORGE-P"
```
