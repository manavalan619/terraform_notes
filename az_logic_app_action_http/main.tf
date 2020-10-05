### Create a logic app action http

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
  l_rg_name = var.assie_rgName

  ### calculate logic app action http name
  l_cloud_code     = "az"
  l_resource_code  = "laah"
  l_resource_index = var.module_laahIndex
  l_resource_name  = format("%s%s%s%s%02d", local.l_cloud_code, local.l_resource_code, local.l_tags["Environment"], local.l_tags["ApplicationCode"], local.l_resource_index)
}

# ======================================================
# Logic App Action Http Resource
# ======================================================

resource "azurerm_logic_app_action_http" "laah" {
  name         = local.l_resource_name
  logic_app_id = data.azurerm_logic_app_workflow.alaw.id
  method       = var.module_laahMethod
  uri          = var.module_laahUri
  body         = var.module_laahBody
  headers      = var.module_laahHeaders
  depends_on   = [var.resource_depends_on]
  count        = var.module_create ? 1 : 0
}
