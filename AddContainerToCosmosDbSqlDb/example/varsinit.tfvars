project_resource_group_name = "RG-TOTAL-WU-GEORGE"
acsc_name                   = "acsc-dv-test-george"
acsc_account_name           = "acdb-dv-test-george"
acsc_database_name          = "acdb_cosmosdb_sqldb-dv-test-george"
acsc_partition_key_path     = "/definition/id"
acsc_unique_key_paths       = ["/definition/idlong", "/definition/idshort"]
acsc_throughput             = 500
acsc_default_ttl            = 10000
resource_depends_on         = null
resource_deploy             = true
