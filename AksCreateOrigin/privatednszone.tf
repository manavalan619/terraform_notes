# ==================================================================================
# Creates a private DNS Zone
# ==================================================================================
resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = "${lower(var.short_project_name)}-${lower(var.env_code)}.azr.tgscloud.net" // lower("dns-private-zone-${var.short_project_name}-${var.env_code}")
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
}

// For a Custom or Private DNS zone, the domain name should be internally 
// resolvable to the private IP address of the Application Gateway
resource "azurerm_private_dns_zone_virtual_network_link" "vnetlink" {
  name                  = lower("${var.short_project_name}") // lower("${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-dns-private-zone-vnetlink-") // "${var.short_project_name}"
  resource_group_name   = data.azurerm_resource_group.project_resource_group.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name   
  virtual_network_id    = azurerm_virtual_network.aks_vnet[0].id      
  registration_enabled  = true // Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled? Defaults to false.
}

// create a private DNS zone A record for apim backend
# resource "azurerm_private_dns_a_record" "app_gw_private_dns_A_record" {
#   name                = lower("app_gw_private_dns_A_record-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
#   zone_name           = azurerm_private_dns_zone.private_dns_zone.name
#   resource_group_name = data.azurerm_resource_group.project_resource_group.name
#   ttl                 = 300
#   records             = ["${split(".",split("/",azurerm_subnet.appgwsubnet.address_prefix)[0])[0]}.${split(".",split("/",azurerm_subnet.appgwsubnet.address_prefix)[0])[1]}.${split(".",split("/",azurerm_subnet.appgwsubnet.address_prefix)[0])[2]}.${split(".",split("/",azurerm_subnet.appgwsubnet.address_prefix)[0])[3]+10}"]
# }
// azurerm_private_dns_a_record.app_gw_private_dns_A_record.fqdn
