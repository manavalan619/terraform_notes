# ==============================================================
# Data sources
# ==============================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

# ==============================================================
# Manages an Authorization Rule in the EventHub Namespace
# ==============================================================
resource "azurerm_eventhub_namespace_authorization_rule" "aehar" {
  name                = var.aehar_name
  namespace_name      = var.aehar_namespace_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  listen              = var.aehar_listen
  send                = var.aehar_send
  manage              = var.aehar_manage

 // (Temporary) unmanaged attributes (will be included in the scope later) :
  # timeouts {
  #   create = var.aehar_timeouts_create
  #   update = var.aehar_timeouts_update
  #   read   = var.aehar_timeouts_read
  #   delete = var.aehar_timeouts_delete
  # }

  count               = (var.resource_deploy ? 1 : 0)
  depends_on          = [var.resource_depends_on]
}