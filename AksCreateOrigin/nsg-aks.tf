
// Not set here
// Define any required ports and forwarding as part of your Kubernetes Service manifests, 
// and let the Azure platform create or update the appropriate rules. 
// You can also use network policies, to automatically apply traffic filter rules to pods.
//
// more info here : https://docs.microsoft.com/en-us/azure/aks/concepts-network#network-security-groups

# resource "azurerm_network_security_group" "aks_nsg" { 
#   count                        = var.deploy_aks ? 1 : 0
#   name                         = "aks-nsg"

# #   security_rule {
# #     access                     = "Allow"
# #     destination_address_prefix = "AzureActiveDirectory"
# #     destination_port_ranges    = ["443", "80"]
# #     direction                  = "Outbound"
# #     name                       = "AllowAzureActiveDirectoryOutBound"
# #     priority                   = 100
# #     protocol                   = "TCP"
# #     source_address_prefix      = "VirtualNetwork"
# #     source_port_range          = "*"
# #   }

# }

# // attach nsg to aks subnet
# resource "azurerm_subnet_network_security_group_association" "aks_nsg_subnet_association" {
#   subnet_id                 = azurerm_subnet.kubesubnet[0].id
#   network_security_group_id = azurerm_network_security_group.aks_nsg[0].id
# }