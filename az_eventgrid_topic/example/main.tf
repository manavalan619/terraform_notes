# ======================================================
# Creates EventGrid Topic
# ======================================================

module "aegt" {
  source           = "git::https://dev.azure.com/tgits-code/ASSIE%20AZURE/_git/az_eventgrid_topic?ref=master"
  providers        = { azurerm = azurerm.xx }
  assie_rgName     = var.assie_rgName
  assie_rgLocation = var.assie_rgLocation
  assie_rgTags     = var.assie_rgTags
  module_aegtIndex = var.module_aegtIndex
  module_create    = var.module_create
}