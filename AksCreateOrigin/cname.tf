# ==============================================================================
# Creates a DNS Cname Record
# ==============================================================================
# resource "azurerm_dns_cname_record" "cname" {
#   name                = var.cname_name
#   zone_name           = var.cname_dns_zone
#   resource_group_name = data.azurerm_resource_group.project_resource_group.name
#   ttl                 = 300
#   record              = var.cname_record
# }