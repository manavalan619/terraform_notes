# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

# ======================================================
# Creates an Output Cosmos DB in Stream Analytics
# Cosmosdb Account API = SQL API
# ======================================================
resource "azurerm_template_deployment" "darm" {
  name                = var.arm_template_deployment_name // "stream-deployment-02"
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  template_body       = file("${path.module}/arm/template.json")

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters = {
    sta_job_name            = var.sta_job_name,
    sta_outputcosmosdb_name = var.sta_outputcosmosdb_name,
    accountId               = var.accountId,
    accountKey              = var.accountKey,
    database                = var.database,
    collectionNamePattern   = var.collectionNamePattern
  }

  deployment_mode = "Incremental"

  count      = (var.resource_deploy ? 1 : 0)
  depends_on = [var.resource_depends_on]
}