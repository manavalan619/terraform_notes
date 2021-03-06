project_resource_group_name            = "RG-TOTAL-WU-GEORGE"
project_name                           = "testproj"
env_code                               = "dv"
short_project_name                     = "test"
acdb_offer_type                        = "Standard"
acdb_kind                              = "GlobalDocumentDB"
acdb_consistency_level                 = "BoundedStaleness"
acdb_enable_automatic_failover         = true
acdb_max_interval_in_seconds           = 310
acdb_max_staleness_prefix              = 100001
acdb_primary_failover_priority         = 1
acdb_secondary_failover_priority       = 0
acdb_primary_failover_location         = "North Europe"
acdb_capabilities_name                 = "MongoDBv3.4"
acdb_is_virtual_network_filter_enabled = true
acdb_enable_multiple_write_locations   = false
acdb_network_rule_subnets              = ["/subscriptions/47ea923d-bbfb-4cae-a53b-6ae79b0d836f/resourceGroups/RG-TOTAL-WU-GEORGE/providers/Microsoft.Network/virtualNetworks/avnet-dv-test-george-1/subnets/subnet-dv-test-george"]
location_code                          = "ne"
