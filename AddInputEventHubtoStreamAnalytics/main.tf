# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

data "azurerm_eventhub_namespace" "aehn" {
  name                = var.aehn_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
}

data "azurerm_eventhub" "aeh" {
  name                = var.aeh_name
  namespace_name      = data.azurerm_eventhub_namespace.aehn.name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
}

data "azurerm_eventhub_consumer_group" "aehcg" {
  name                = var.aehcg_name
  namespace_name      = data.azurerm_eventhub_namespace.aehn.name
  eventhub_name       = data.azurerm_eventhub.aeh.name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
}

# ======================================================
# Creates an Input Eventhub in Stream Analytics 
# ======================================================
resource "azurerm_stream_analytics_stream_input_eventhub" "sta_inputeventhub" {
  name                         = var.sta_inputeventhub_name
  resource_group_name          = data.azurerm_resource_group.project_resource_group.name
  stream_analytics_job_name    = var.sta_name
  eventhub_consumer_group_name = data.azurerm_eventhub_consumer_group.aehcg.name
  eventhub_name                = data.azurerm_eventhub.aeh.name
  servicebus_namespace         = data.azurerm_eventhub_namespace.aehn.name
  shared_access_policy_key     = var.sta_inputeventhub_shared_access_policy_key
  shared_access_policy_name    = var.sta_inputeventhub_shared_access_policy_name
  serialization {
    type     = var.sta_inputeventhub_serialization_type
    encoding = var.sta_inputeventhub_serialization_encoding
    # delimiter = lookup(var.sta_inputeventhub_serialization_field_delimiter, "delimiter", null)
    # field_delimiter = var.sta_inputeventhub_serialization_field_delimiter
  }

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # timeouts {
  #   create = var.sta_inputeventhub_timeouts_create
  #   update = var.sta_inputeventhub_timeouts_update
  #   read   = var.sta_inputeventhub_timeouts_read
  #   delete = var.sta_inputeventhub_timeouts_delete
  # }

  count      = (var.resource_deploy ? 1 : 0)
  depends_on = [var.resource_depends_on]
}