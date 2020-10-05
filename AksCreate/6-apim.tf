
# ==============================================================================
# Creates Api Management 
# ==============================================================================
// notes on Private Link Endpoints for subnets
// (NSG), are not supported for Private Link Endpoints or Private Link Services. 
// In order to deploy a Private Link Endpoint on a given subnet, 
// you must set the enforce_private_link_endpoint_network_policies attribute to true. 
// This setting is only applicable for the Private Link Endpoint, for all other resources 
// in the subnet access is controlled based via the Network Security Group which can be configured 
// using the azurerm_subnet_network_security_group_association resource.

// more info here : https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview
// limitations : https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview#limitations

module "apim" {
  source                      = "../ApiManagement/" 
  resource_deploy             = var.aks_resource_deploy
  project_name                = var.project_name
  short_project_name          = var.short_project_name
  project_resource_group_name = var.project_resource_group_name
  env_code                    = var.env_code

  apim_publisher_name         = local.apim_publisher_target_name 
  apim_publisher_email        = var.apim_publisher_email  
  apim_sku_name               = var.apim_sku_name         // "Developer_1"  in AnteProd "Premium_2" in Prod
  apim_xml_content            = <<XML
    <policies>
      <inbound />
      <backend />
      <outbound />
      <on-error />
    </policies>
XML

  apim_identity_ids                 = var.aks_resource_deploy ? [module.apim_user_assigned_identity.uai_id[0]] : []
  apim_vnet_type                    = "External"
  apim_vnet_configuration_subnet_id = var.aks_resource_deploy ? module.aks_apim_subnet.subnet_id[0] : ""

  resource_depends_on               = [module.apim_user_assigned_identity, module.aks_apim_subnet, module.aks_vnet_private_dns_zone] // [azurerm_private_dns_zone_virtual_network_link.vnetlink]

}


