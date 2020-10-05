### Create a eventhubs namespace

# ======================================================
# Local variables
# ======================================================

locals {
  l_tags = {
    Environment     = var.assie_rgTags["Environment"]
    ApplicationName = var.assie_rgTags["ApplicationName"]
    ApplicationCode = var.assie_rgTags["ApplicationCode"]
    Branch          = var.assie_rgTags["Branch"]
    Exploitation    = var.assie_rgTags["Exploitation"]
    SecurityLevel   = var.assie_rgTags["SecurityLevel"]
  }
  l_rg_name     = var.assie_rgName
  l_rg_location = var.assie_rgLocation

  ### Calculate EventHubs Namespace Name

  l_cloud_code     = "az"
  l_resource_code  = "ehn"
  l_resource_index = var.module_aehnIndex
  l_resource_name  = format("%s%s%s%s%02d", local.l_cloud_code, local.l_resource_code, local.l_tags["Environment"], local.l_tags["ApplicationCode"], local.l_resource_index)
}

# ======================================================
# Event Hubs Namespace Resource
# ======================================================

resource "azurerm_eventhub_namespace" "aehn" {
  name                     = local.l_resource_name
  location                 = local.l_rg_location
  resource_group_name      = local.l_rg_name
  sku                      = var.module_aehnSku
  capacity                 = var.module_aehnCapacity
  auto_inflate_enabled     = var.module_aehnAutoInflateEnabled     // scale automatically ?
  maximum_throughput_units = var.module_aehnMaximumThroughputUnits // if auto_inflate_enabled = false THEN maximum_throughput_units = null ELSE IF auto_inflate_enabled = true THEN 1 < maximum_throughput_units 20

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # network_rulesets {
  #   default_action       = var.module_aehnNetworkRulesetsDefaultAction
  #   virtual_network_rule {
  #     subnet_id = var.module_aehnSubnetId
  #     ignore_missing_virtual_network_service_endpoint = var.module_aehnIgnoreMissingVirtualNetworkServiceEndpoint
  #   }
  #   ip_rule {
  #     ip_mask = var.aehn_network_rulesets_network_rulesets_ip_rule_ip_mask
  #     action  = var.aehn_network_rulesets_ip_rule_action
  #   }
  # }

  tags  = local.l_tags
  count = var.module_create ? 1 : 0
}