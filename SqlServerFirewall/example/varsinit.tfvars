project_resource_group_name = "RG-TOTAL-WU-GEORGE"
sqlsrv_name                 = "ass0david"
sqlsrv_fw_rules = {
  dev = {
    "name"     = "firewall"
    "start_ip" = "10.0.17.62"
    "end_ip"   = "10.0.17.62"
  }
}
resource_deploy     = true
resource_depends_on = null
