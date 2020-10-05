# ======================================================
# Data Sources
# ======================================================

data "azurerm_logic_app_workflow" "alaw" {
  name                = var.alaw_name
  resource_group_name = local.l_rg_name
}