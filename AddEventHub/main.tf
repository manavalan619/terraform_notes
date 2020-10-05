# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

# ======================================================
# Creates an Event Hub
# ======================================================
resource "azurerm_eventhub" "aeh" {
  name                = var.aeh_name
  namespace_name      = var.aehn_name
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  partition_count     = var.aeh_partition_count
  message_retention   = var.aeh_message_retention

  // (Temporary) unmanaged attributes (will be included in the scope later) :
  # capture_description {
  #   enabled             = var.aeh_capture_descr_enabled
  #   encoding            = var.aeh_capture_descr_encoding
  #   interval_in_seconds = var.aeh_capture_descr_interval_in_seconds
  #   size_limit_in_bytes = var.aeh_capture_descr_size_limit_in_bytes
  #   skip_empty_archives = var.aeh_capture_descr_skip_empty_archives

  #   destination {
  #     name = var.aeh_capture_destination_name
  #     archive_name_format = var.aeh_capture_destination_archive_name_format
  #     blob_container_name = var.aeh_capture_destination_blob_container_name
  #     storage_account_id = var.aeh_capture_destination_storage_account_id
  #   }

  count               = (var.resource_deploy ? 1 : 0)
  depends_on          = [var.resource_depends_on]

}

