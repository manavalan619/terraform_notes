# ======================================================
# AKS resource - Output Variables
# ======================================================
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
