# ==============================================================================
# IOT  MODULES
# ==============================================================================
module "ioth" {
  source                 = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/az_iothub/"
  providers              = { azurerm = azurerm.xx }
  assie_rgName           = var.assie_rgName
  assie_rgTags           = var.assie_rgTags
  assie_rgLocation       = var.assie_rgLocation
  module_iothSkuName     = var.module_iothSkuName
  module_iothSkuCapacity = var.module_iothSkuCapacity
  module_create          = var.module_create
  module_iothIndex       = var.module_iothIndex
}
