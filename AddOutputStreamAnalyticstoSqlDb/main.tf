# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

# ======================================================
# Creates an Output SQL DB in Stream Analytics
# ======================================================
resource "azurerm_stream_analytics_output_mssql" "sta_outputsqldb" {
  name                      = var.sta_outputsql_name
  resource_group_name       = data.azurerm_resource_group.project_resource_group.name
  stream_analytics_job_name = var.sta_outputsqldb_stream_analytics_job_name
  server                    = var.sta_outputsqldb_server
  user                      = var.sta_outputsqldb_user
  password                  = var.sta_outputsqldb_password
  database                  = var.sta_outputsqldb_database_name
  table                     = var.sta_outputsqldb_table
  timeouts {
    create = var.sta_outputsqldb_timeouts_create
    update = var.sta_outputsqldb_timeouts_update
    read   = var.sta_outputsqldb_timeouts_read
    delete = var.sta_outputsqldb_timeouts_delete
  }

  count      = (var.resource_deploy ? 1 : 0)
  depends_on = [var.resource_depends_on]
}