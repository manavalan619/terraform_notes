# ========================================================================
# Creates a diagnotics Setting for AKS
# By default diagnostic logs are sent to a Log Analytics Workspace.
# But diagnostic logs can be sent to an Azure storage account or Event hub.
# ========================================================================
# resource "azurerm_monitor_diagnostic_setting" "aks_diag" {

#   count = (var.aks_diagnostics_map.log_analytics_workspace_id != "" || lookup(var.aks_diagnostics_map, "aeh_name", null) != null) ? 1 : 0

#   name                           = local.aks_diag_target_name // "${azurerm_kubernetes_cluster.aks[0].name}-diag"
#   # target_resource_id             = azurerm_kubernetes_cluster.aks[0].id                  // AKS Cluster created for the project
#   # target_resource_id             = azurerm_kubernetes_cluster.aks.id   // [count.index]
#   target_resource_id             = [for instance in azurerm_kubernetes_cluster.aks : instance.id]
#   log_analytics_workspace_id     = var.aks_diagnostics_map.log_analytics_workspace_id // default
#   eventhub_name                  = lookup(var.aks_diagnostics_map, "aeh_name", null)  // if no event hub if specified then null
#   eventhub_authorization_rule_id = length(lookup(var.aks_diagnostics_map, "aeh_id", "")) > 1 ? "${var.aks_diagnostics_map.aeh_id}/authorizationrules/RootManageSharedAccessKey" : null // if no event hub if specified then null

#   storage_account_id             = lookup(var.aks_diagnostics_map, "asa_diagnostic_setting_id", null)  // if no event hub if specified then null

#   dynamic "log" {
#     for_each = var.aks_diagnostics_logs_map.log
#     content {
#       category = log.value[0]
#       enabled  = log.value[1]
#       retention_policy {
#         enabled = log.value[2]
#         days    = log.value[3]
#       }
#     }
#   }

#   dynamic "metric" {
#     for_each = var.aks_diagnostics_logs_map.metric
#     content {
#       category = metric.value[0]
#       enabled  = metric.value[1]
#       retention_policy {
#         enabled = metric.value[2]
#         days    = metric.value[3]
#       }
#     }
#   }
# }