# resource "azurerm_network_security_group" "apim_nsg" { 
#   count                        = var.deploy_aks ? 1 : 0
#   name                         = "apim-nsg"
#   location                     = data.azurerm_resource_group.project_resource_group.location 
#   resource_group_name          = data.azurerm_resource_group.project_resource_group.name

#   // Allow AAD OutBound
#   security_rule {
#     access                     = "Allow"
#     destination_address_prefix = "AzureActiveDirectory"
#     destination_port_ranges    = ["443", "80"]
#     direction                  = "Outbound"
#     name                       = "AllowAzureActiveDirectoryOutBound"
#     priority                   = 100
#     protocol                   = "TCP"
#     source_address_prefix      = "VirtualNetwork"
#     source_port_range          = "*"
#   }

#   // Allow Client Communication To APIM InBound
#   security_rule {
#     access                     = "Allow"
#     destination_address_prefix = "VirtualNetwork"
#     destination_port_ranges    = ["443", "80"]
#     direction                  = "Inbound"
#     name                       = "AllowClientCommunicationToApiInBound"
#     priority                   = 100
#     protocol                   = "TCP"
#     source_address_prefix      = "*"
#     source_port_range          = "*"
#   }

#   // Allow APIMInBound
#   security_rule {
#     access                     = "Allow"
#     destination_address_prefix = "VirtualNetwork"
#     destination_port_range     = "3443"
#     direction                  = "Inbound"
#     name                       = "AllowApiManagementInBound"
#     priority                   = 110
#     protocol                   = "TCP"
#     source_address_prefix      = "ApiManagement"
#     source_port_range          = "*"
#   }
# }

# // attach nsg to apim subnet
# resource "azurerm_subnet_network_security_group_association" "apim_nsg_subnet_association" {
#   subnet_id                 = azurerm_subnet.apim_subnet[0].id
#   network_security_group_id = azurerm_network_security_group.apim_nsg[0].id
# }