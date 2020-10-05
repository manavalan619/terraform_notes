### Create a Firewall Rule for a PostgreSQL Server
#### DLR - 20200615 - v0.3

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

  l_cloud_code     = "az"
  l_resource_code  = "egd"
  l_resource_index = var.module_aegdIndex
  l_resource_name  = lower(format("%s%s%s%s%02d", local.l_cloud_code, local.l_resource_code, local.l_tags["Environment"], local.l_tags["ApplicationCode"], local.l_resource_index))
}
# ======================================================
# Creates EventGrid Domain
# ======================================================

resource "azurerm_eventgrid_domain" "aegd" {
  name                = local.l_resource_name
  location            = local.l_rg_location
  resource_group_name = local.l_rg_name
  count               = var.module_create ? 1 : 0
  input_schema        = var.module_aegdInputSchema

  input_mapping_fields {
    id           = var.module_aegdId
    topic        = var.module_aegdTopic
    event_type   = var.module_aegdEventType
    subject      = var.module_aegdSubject
    data_version = var.module_aegdDataVersion
  }
  tags = local.l_tags
}
