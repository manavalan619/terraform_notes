# ==============================================================
# Data sources
# ==============================================================
# creates eventhub namespace

module "aehn" {
  source                        = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/EventHubsNamespace/"
  project_resource_group_name   = var.project_resource_group_name
  env_code                      = var.env_code
  project_name                  = var.project_name
  short_project_name            = var.short_project_name
  aehn_sku                      = var.aehn_sku
  aehn_capacity                 = var.aehn_capacity
  aehn_auto_inflate_enabled     = var.aehn_auto_inflate_enabled
  aehn_maximum_throughput_units = var.aehn_maximum_throughput_units
  resource_deploy               = var.resource_deploy
}

# ==============================================================
# Creates Authorization Rule in the EventHub Namespace
# ==============================================================

module "aehar" {
  source                      = "git::https://__GIT-TOKEN__@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/AddEventHubNamespaceAuthorizationRule/"
  aehar_name                  = var.aehar_name
  aehar_namespace_name        = element(module.aehn.aehn_name, 0)
  project_resource_group_name = var.project_resource_group_name
  aehar_listen                = var.aehar_listen
  aehar_send                  = var.aehar_send
  aehar_manage                = var.aehar_manage
  resource_deploy             = var.resource_deploy
  resource_depends_on         = var.resource_depends_on
}