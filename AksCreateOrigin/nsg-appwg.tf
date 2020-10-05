# resource "azurerm_network_security_group" "appgw_nsg" { 
#   count                        = var.deploy_aks ? 1 : 0
#   name                         = "appwg-nsg"
#   location                     = data.azurerm_resource_group.project_resource_group.location 
#   resource_group_name          = data.azurerm_resource_group.project_resource_group.name
  
#   security_rule {
#       access                                     = "Allow"
#       destination_address_prefix                 = "*"
#       destination_port_range                     = "65200-65535"
#       direction                                  = "Inbound"
#       name                                       = "AllowBackendHealthPortsInBound"
#       priority                                   = 100
#       protocol                                   = "TCP"
#       source_address_prefix                      = "*"
#       source_port_range                          = "*"
#   }
#   security_rule {
#     access                                     = "Allow"
#     destination_address_prefix                 = "*"
#     destination_port_range                     = "443"
#     direction                                  = "Inbound"
#     name                                       = "AllowApiManagerHttpsInBound"
#     priority                                   = 110
#     protocol                                   = "TCP"
#     source_address_prefix                      = "*"
#     source_port_range                          = "*"
#   }
# }

# // attach nsg to appgw subnet
# resource "azurerm_subnet_network_security_group_association" "appgw_nsg_subnet_association" {
#   subnet_id                 = azurerm_subnet.appgw_subnet[0].id // data.azurerm_subnet.appgwsubnet[0].id
#   network_security_group_id = azurerm_network_security_group.appgw_nsg[0].id
# }