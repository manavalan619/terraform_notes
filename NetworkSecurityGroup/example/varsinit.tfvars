project_resource_group_name = "RG-TOTAL-WU-GEORGE"
ansg_name                   = "aase0tasnime"
ansg_security_rules = [{
  security_rule_name                                       = "test123"
  security_rule_description                                = ""
  security_rule_priority                                   = 100
  security_rule_direction                                  = "Inbound"
  security_rule_access                                     = "Allow"
  security_rule_protocol                                   = "Tcp"
  security_rule_source_port_range                          = "*"
  security_rule_destination_port_range                     = "*"
  security_rule_source_address_prefix                      = "*"
  security_rule_destination_address_prefix                 = "*"
  security_rule_source_port_ranges                         = []
  security_rule_destination_port_ranges                    = []
  security_rule_source_application_security_group_ids      = []
  security_rule_source_address_prefixes                    = []
  security_rule_destination_address_prefixes               = []
  security_rule_destination_application_security_group_ids = []

}]
resource_deploy = true