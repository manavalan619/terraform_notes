### Create a EventGrid Topic

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

  ### calculate eventGrid topic name
  l_cloud_code     = "az"
  l_resource_code  = "egt"
  l_resource_index = var.module_aegtIndex
  l_resource_name  = format("%s%s%s%s%02d", local.l_cloud_code, local.l_resource_code, local.l_tags["Environment"], local.l_tags["ApplicationCode"], local.l_resource_index)
}

# ======================================================
# EventGrid Topic Resource
# ======================================================
resource "azurerm_eventgrid_topic" "aegt" {
  name                = local.l_resource_name
  location            = local.l_rg_location
  resource_group_name = local.l_rg_name
  tags                = local.l_tags
  count               = var.module_create ? 1 : 0
}
