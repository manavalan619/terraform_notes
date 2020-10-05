# ======================================================
# Logic App Trigger Custom Resource
# ======================================================

module "alatc" {
  source              = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/az_logic_app_trigger_custom/"
  providers           = { azurerm = azurerm.xx }
  assie_rgName        = var.assie_rgName
  assie_rgTags        = var.assie_rgTags
  alaw_name           = var.alaw_name
  module_alatcBody    = var.module_alatcBody
  module_alatcIndex   = var.module_alatcIndex
  resource_depends_on = var.resource_depends_on
  module_create       = var.module_create
}
