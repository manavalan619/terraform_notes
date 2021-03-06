project_resource_group_name = "RG-TOTAL-WU-GEORGE"
resource_deploy             = true
resource_depends_on         = null
#sta
project_name                                 = "testproject"
short_project_name                           = "test"
env_code                                     = "dv"
sta_output_error_policy                      = "Drop"
sta_events_out_of_order_policy               = "Adjust"
sta_events_out_of_order_max_delay_in_seconds = "50"
sta_events_late_arrival_max_delay_in_seconds = "60"
sta_streaming_units                          = "3"
sta_transformation_query                     = "SELECT	* INTO Output FROM Input"
sta_with_managed_identity_deployment_name    = "acctesttemplate-01"
sta_data_locale                              = "en-GB"
sta_compatibility_level                      = "1.1"
location_code                                = "ne"
#sta_outputsqldb
sta_outputsqldb_server          = "rgthomasssqlserver.database.windows.net"
sta_outputsqldb_user            = "mradministrator"
sta_outputsqldb_password        = "rgtotalthomas"
sta_outputsqldb_database_name   = "sampledemo"
sta_outputsqldb_table           = "Persons"
sta_outputsql_name              = "demo"
sta_outputsqldb_timeouts_create = "5m"
sta_outputsqldb_timeouts_update = "5m"
sta_outputsqldb_timeouts_read   = "5m"
sta_outputsqldb_timeouts_delete = "5m"
