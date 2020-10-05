# ==============================================================================
# Azure Private DNS Zone - Output variables
# ==============================================================================
output "pdz_id" {
    value       = [for instance in azurerm_private_dns_zone.private_dns_zone : instance.id]
    description = "The Private DNS Zone ID."
}
output "pdz_number_of_record_sets" {
    value       = [for instance in azurerm_private_dns_zone.private_dns_zone : instance.number_of_record_sets]
    description = "The current number of record sets in this Private DNS zone."
}
output "pdz_max_number_of_record_sets" {
    value       = [for instance in azurerm_private_dns_zone.private_dns_zone : instance.max_number_of_record_sets]
    description = "The maximum number of record sets that can be created in this Private DNS zone."
}
output "pdz_max_number_of_virtual_network_links" {
    value       = [for instance in azurerm_private_dns_zone.private_dns_zone : instance.max_number_of_virtual_network_links]
    description = "The maximum number of virtual networks that can be linked to this Private DNS zone."
}
output "pdz_max_number_of_virtual_network_links_with_registration" {
    value       = [for instance in azurerm_private_dns_zone.private_dns_zone : instance.max_number_of_virtual_network_links_with_registration]
    description = "The maximum number of virtual networks that can be linked to this Private DNS zone with registration enabled."
}