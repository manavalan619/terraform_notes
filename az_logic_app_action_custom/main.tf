### Create a logic app action custom

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

  ### calculate logic app action custom name
  l_cloud_code     = "az"
  l_resource_code  = "laac"
  l_resource_index = var.module_alaacIndex
  l_resource_name  = format("%s%s%s%s%02d", local.l_cloud_code, local.l_resource_code, local.l_tags["Environment"], local.l_tags["ApplicationCode"], local.l_resource_index)
}

# ======================================================
# Logic App Action Custom Resource
# ======================================================

resource "azurerm_logic_app_action_custom" "alaac" {
  name         = local.l_resource_name
  logic_app_id = data.azurerm_logic_app_workflow.alaw.id
  body         = var.module_alaaBody
  depends_on   = [var.resource_depends_on]
  count        = var.module_create ? 1 : 0
}
