# ======================================================
# Logic App Action Http Resource
# ======================================================

module "laah" {
  # source             = "git::https://___GIT-TOKEN___@dev.azure.com/TotalDataLake/REF-DEF-DEVOPS/_git/REF-TF-MODULES//providers/azure/az_logic_app_action_http/"
  source             = "../../az_logic_app_action_http"
  providers          = { azurerm = azurerm.xx }
  assie_rgName       = var.assie_rgName
  assie_rgTags       = var.assie_rgTags
  alaw_name          = var.alaw_name
  module_create      = var.module_create
  module_laahIndex   = var.module_laahIndex
  module_laahMethod  = var.module_laahMethod
  module_laahUri     = var.module_laahUri
  module_laahHeaders = var.module_laahHeaders
  module_laahBody    = var.module_laahBody
}
