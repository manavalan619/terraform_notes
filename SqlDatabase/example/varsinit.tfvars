project_resource_group_name            = "RG-TOTAL-WU-GEORGE"
sqlsrv_ad_login                        = "david-security-group"
sqlsrv_ad_admin_group                  = "ZG-AZR-TGS-TEAMDEVOPS-DEVELOPER"
sqlsrv_administrator_login             = "sqlsrv_administrator_login"
sqlsrv_version                         = "12.0"
sqldb_edition                          = "DataWarehouse"
sqldb_requested_service_objective_name = "DW100c"
project_name                           = "testproject"
env_code                               = "dv"
short_project_name                     = "test"
resource_index                         = 1
location_code                          = "ne"
sqlsrv_fw_rules = {
  dev = {
    "name"     = "firewall"
    "start_ip" = "10.0.17.62"
    "end_ip"   = "10.0.17.62"
  }
}
