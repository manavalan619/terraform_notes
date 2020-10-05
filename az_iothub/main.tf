
# ======================================================
# Manages internal rules and resources naming rules 
# ======================================================
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

  dv = [upper(format("%s%s-%s%s", "ZG-AZR-", local.l_tags["Branch"], local.l_tags["ApplicationName"], "-TECHLEAD")), upper(format("%s%s-%s%s", "ZG-AZR-", local.l_tags["Branch"], local.l_tags["ApplicationName"], "-DEVELOPER")), upper(format("%s%s-%s%s", "ZG-AZR-", local.l_tags["Branch"], local.l_tags["ApplicationName"], "-TMA"))]
  at = []
  hp = []
  p  = []

  contrib = "Contributor"
  reader  = "Reader"

  // adf Project naming convention
  l_cloud_code     = "az"
  l_resource_code  = "ioth"
  l_resource_index = var.module_iothIndex
  l_resource_name  = format("%s%s%s%s%02d", local.l_cloud_code, local.l_resource_code, local.l_tags["Environment"], local.l_tags["ApplicationCode"], local.l_resource_index)

}

# ======================================================
# azurerm Iot Hub
# ======================================================

resource "azurerm_iothub" "ioth" {
  name                = local.l_resource_name
  resource_group_name = local.l_rg_name
  location            = local.l_rg_location

  sku {
    name     = var.module_iothSkuName
    capacity = var.module_iothSkuCapacity
  }
  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # endpoint {
  #   type                       = var.module_iothEndpointType
  #   connection_string          = data.azurerm_storage_account.asa.primary_blob_connection_string
  #   name                       = var.module_iothEndpointName
  #   batch_frequency_in_seconds = var.module_iothEndpointFrequency
  #   max_chunk_size_in_bytes    = var.module_iothEndpointChunkSize
  #   container_name             = data.azurerm_storage_container.ascn.name
  #   encoding                   = var.module_iothEndpointEncoding
  #   file_name_format           = var.module_iothEndpointFileNameFormat
  # }

  # route {
  #   name           = var.module_iothRouteName
  #   source         = var.module_iothRouteSource
  #   condition      = var.module_iothRouteCondition
  #   endpoint_names = var.module_iothRouteEndpointNames
  #   enabled        = var.module_iothRouteEnabled
  # }
  #   endpoint {
  #   type              = "AzureIotHub.EventHub"
  #   connection_string = data.azurerm_eventhub_authorization_rule.aiothepsc.primary_connection_string
  #   name              = "export2"
  # }

  # ip_filter_rule {
  #   name    = var.module_iothIpFilterRuleName
  #   ip_mask = var.module_iothIpFilterRuleIp
  #   action  = var.module_iothIpFilterRuleAction
  # }

  # fallback_route {
  #   source         = var.module_iothFallbackRouteSource
  #   condition      = var.module_iothFallbackRouteCondition
  #   endpoint_names = var.module_iothFallbackRouteEndpointNames
  # }

  # file_upload {
  #   connection_string = var.module_iothConnectionString
  #   container_name    = var.module_iothContainerName
  # }
  count = var.module_create ? 1 : 0
  tags  = local.l_tags
}

# ======================================================
# Rbac assigment
# ======================================================
module "role" {
  source               = "../AssignRbacRole/"
  aad_group_list       = lookup({ dv = local.dv, at = local.at, hp = local.hp, p = local.p }, var.env_code)
  role_scope_ids       = var.resource_deploy ? [for instance in azurerm_iothub.aioth : instance.id] : []
  role_definition_name = lookup({ dv = local.contrib, at = local.reader, hp = local.reader, p = local.reader }, var.env_code)
}
