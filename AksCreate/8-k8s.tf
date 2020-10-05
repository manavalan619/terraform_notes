# ==============================================================================
# Creates AKS cluster
# ==============================================================================
module "aks" {
    source                      = "../KubernetesCluster/" 
    resource_deploy             = var.aks_resource_deploy
    project_name                = var.project_name
    short_project_name          = var.short_project_name
    project_resource_group_name = var.project_resource_group_name
    env_code                    = var.env_code

    // aks core variables
    aks_dns_prefix              = var.aks_dns_prefix
    aks_version                 = var.aks_version
    aks_agent_count             = var.aks_agent_count
    aks_agent_vm_size           = var.aks_agent_vm_size
    aks_agent_os_disk_size      = var.aks_agent_os_disk_size
    aks_vnet_subnet_id          = var.aks_resource_deploy ? module.aks_kube_subnet.subnet_id[0] : ""
    aks_service_cidr            = var.aks_service_cidr
    aks_dns_service_ip          = var.aks_dns_service_ip
    aks_docker_bridge_cidr      = var.aks_docker_bridge_cidr
    aks_addon_profile           = var.aks_addon_profile

    resource_depends_on     = [module.vnet_aks, module.aks_kube_subnet, module.appgw]
   
}