# ======================================================
# AKS Cluster - Output Variables
# ======================================================
output "aks_cluster_id" {
  description = "The Kubernetes Managed Cluster ID."
  value       = [for instance in azurerm_kubernetes_cluster.aks : instance.id]
}
output "aks_cluster_fqdn" {
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
  value       = [for instance in azurerm_kubernetes_cluster.aks : instance.fqdn]
}
output "aks_cluster_private_fqdn" {
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
  value       = [for instance in azurerm_kubernetes_cluster.aks : instance.private_fqdn]
}
output "aks_kube_admin_config" {
  description = "A kube_admin_config block as defined below. This is only available when Role Based Access Control with Azure Active Directory is enabled."
  value       = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_admin_config]
}
output "aks_kube_admin_config_raw" {
  description = "Raw Kubernetes config for the admin account to be used by kubectl and other compatible tools. This is only available when Role Based Access Control with Azure Active Directory is enabled."
  value       = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_admin_config_raw]
}
output "aks_kube_config" {
  description = "A kube_config block as defined below."
  value       = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_config]
}
output "aks_kube_config_raw" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools"
  value       = [for instance in azurerm_kubernetes_cluster.aks : instance.kube_config_raw]
}
# output "aks_http_application_routing" {
#   description = "http_application_routing exporting the Zone Name of the HTTP Application Routing."
#   value       = [for instance in azurerm_kubernetes_cluster.aks : instance.http_application_routing]
# }
output "aks_node_resource_group" {
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
  value       = [for instance in azurerm_kubernetes_cluster.aks : instance.node_resource_group]
}

output "private_key_pem" {
  description = "The private key data in PEM format."
  value       = module.aks_admin_tls_private_key.private_key_pem
}
output "public_key_openssh" {
  description = "The public key data in OpenSSH authorized_keys format, if the selected private key format is compatible. All RSA keys are supported, and ECDSA keys with curves P256, P384 and P521 are supported. This attribute is empty if an incompatible ECDSA curve is selected."
  value       = module.aks_admin_tls_private_key.public_key_openssh
}
# output "aks_kubelet_identity" {
#   description = "A kubelet_identity block as defined below."
#   value       = [for instance in azurerm_kubernetes_cluster.aks : instance.kubelet_identity]
# }