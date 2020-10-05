# ======================================================
# Creates Event Hubs Namespace
# ======================================================

module "aehn" {
  source                            = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/EventHubsNamespace/"
  providers                         = { azurerm = azurerm.xx }
  assie_rgName                      = var.assie_rgName
  assie_rgTags                      = var.assie_rgTags
  assie_rgLocation                  = var.assie_rgLocation
  module_aehnIndex                  = var.module_aehnIndex
  module_aehnSku                    = var.module_aehnSku
  module_aehnCapacity               = var.module_aehnCapacity
  module_aehnAutoInflateEnabled     = var.module_aehnAutoInflateEnabled
  module_aehnMaximumThroughputUnits = var.module_aehnMaximumThroughputUnits
  module_create                     = var.module_create
}