# Create CosmosDb Account
module "acdb" {
  source                                 = "../../CosmosDbAccount"
  project_resource_group_name            = var.project_resource_group_name
  project_name                           = var.project_name
  env_code                               = var.env_code
  short_project_name                     = var.short_project_name
  location_code                          = var.location_code
  acdb_offer_type                        = var.acdb_offer_type
  acdb_kind                              = var.acdb_kind
  acdb_consistency_level                 = var.acdb_consistency_level
  acdb_enable_automatic_failover         = var.acdb_enable_automatic_failover
  acdb_max_interval_in_seconds           = var.acdb_max_interval_in_seconds
  acdb_max_staleness_prefix              = var.acdb_max_staleness_prefix
  acdb_primary_failover_priority         = var.acdb_primary_failover_priority
  acdb_primary_failover_location         = var.acdb_primary_failover_location
  acdb_secondary_failover_priority       = var.acdb_secondary_failover_priority
  acdb_capabilities_name                 = var.acdb_capabilities_name
  acdb_is_virtual_network_filter_enabled = var.acdb_is_virtual_network_filter_enabled
  acdb_enable_multiple_write_locations   = var.acdb_enable_multiple_write_locations
  acdb_network_rule_subnets              = var.acdb_network_rule_subnets
}
