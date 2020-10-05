# ==============================================================================
# EventGrid Domain
# ==============================================================================
module "aegd" {
  source                 = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/az_eventgrid_domain/"
  providers              = { azurerm = azurerm.xx }
  assie_rgName           = var.assie_rgName
  assie_rgLocation       = var.assie_rgLocation
  assie_rgTags           = var.assie_rgTags
  module_aegdIndex       = var.module_aegdIndex
  module_create          = var.module_create
  module_aegdInputSchema = var.module_aegdInputSchema
  module_aegdId          = var.module_aegdId
  module_aegdTopic       = var.module_aegdTopic
  module_aegdEventType   = var.module_aegdEventType
  module_aegdSubject     = var.module_aegdSubject
  module_aegdDataVersion = var.module_aegdDataVersion
}
