# ======================================================
# Logic App Action Custom Resource
# ======================================================

module "alaac" {
  source              = "git::https://dev.azure.com/tgits-code/ASSIE%20AZURE/_git/az_logic_app_action_custom?ref=master"
  providers           = { azurerm = azurerm.xx }
  assie_rgName        = var.assie_rgName
  assie_rgTags        = var.assie_rgTags
  alaw_name           = var.alaw_name
  module_create       = var.module_create
  module_alaacIndex   = var.module_alaacIndex
  module_alaaBody     = var.module_alaaBody
  resource_depends_on = var.resource_depends_on
}