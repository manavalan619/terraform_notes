# ==============================================================================
# Azure Public IP - Output variables
# ==============================================================================
output "apip_id" {
    value       = [for instance in azurerm_public_ip.apip : instance.id]
    description = "The Public IP ID."
}
output "apip_ip_address" {
    value       = [for instance in azurerm_public_ip.apip : instance.ip_address]
    description = "The IP address value that was allocated."
}
output "apip_fqdn" {
    value       = [for instance in azurerm_public_ip.apip : instance.fqdn]
    description = "Fully qualified domain name of the A DNS record associated with the public IP. domain_name_label must be specified to get the fqdn. This is the concatenation of the domain_name_label and the regionalized DNS zone"
}