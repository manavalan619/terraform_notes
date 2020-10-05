variable "project_resource_group_name" {
  type        = string
  description = "(Required) Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
}
# ======================================================
# AKS resource - Variables
# ======================================================
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
