# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}
// Retrieve SUFFIX secret value for akv target name
data "azurerm_key_vault" "akv_tf" {
  name                = local.akv_tf_name
  resource_group_name = local.rg_tf_name
}
data "azurerm_key_vault_secret" "suffix_value" {
  name         = "SUFFIX"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

locals {
 // RG Mgt
 rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
 akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

 // NSG Target Name
 resource_name = lower("ansg-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")

}
# ======================================================
# Creates Network security group
# ======================================================
resource "azurerm_network_security_group" "ansg" {
  count               = (var.resource_deploy ? 1 : 0)
  name                = local.resource_name
  location            = data.azurerm_resource_group.project_resource_group.location
  resource_group_name = data.azurerm_resource_group.project_resource_group.name

  // nsg security_rules       

  dynamic "security_rule" {
    for_each = [for sr in var.ansg_security_rules :
      {
        name                       = sr.name                       // (Required) The name of the security rule.                        
        description                = sr.description                // (Optional) A description for this rule. Restricted to 140 characters.
        priority                   = sr.priority                   // (Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule.
        direction                  = sr.direction                  // (Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound.
        access                     = sr.access                     // (Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny.
        protocol                   = sr.protocol                   // Required) Network protocol this rule applies to. Can be Tcp, Udp, Icmp, or * to match all.
        source_port_range          = sr.source_port_range          // (Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified.
        destination_port_range     = sr.destination_port_range     // (Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified.
        source_address_prefix      = sr.source_address_prefix      // (Optional) CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified.
        destination_address_prefix = sr.destination_address_prefix // (Optional) CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if destination_address_prefixes is not specified.
    }]
    content {
      name                         = security_rule.value.name
      description                  = security_rule.value.description
      priority                     = security_rule.value.priority
      direction                    = security_rule.value.direction
      access                       = security_rule.value.access
      protocol                     = security_rule.value.protocol
      source_port_range            = security_rule.value.source_port_range
      destination_port_range       = security_rule.value.destination_port_range
      source_address_prefix        = security_rule.value.source_address_prefix 
      destination_address_prefix   = security_rule.value.destination_address_prefix
    }
  }

  tags                = data.azurerm_resource_group.project_resource_group.tags
  depends_on          = [var.resource_depends_on]
}