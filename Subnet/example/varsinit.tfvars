project_resource_group_name = "RG-TOTAL-WU-GEORGE"
avnet_address_space         = ["10.0.0.0/16"]
avnet_dns_servers           = ["10.0.0.4", "10.0.0.5"]
resource_deploy             = true
subnet_address_prefix       = ["10.0.1.0/24"]
delegations = [{
  name = "acctestdelegation"
  service_delegation = {
    name    = "Microsoft.ContainerInstance/containerGroups"
    actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
  }
}]
env_code                                              = "dv"
project_name                                          = "testproject"
short_project_name                                    = "proj"
subnet_name                                           = "testproject-thomas"
subnet_enforce_private_link_endpoint_network_policies = false
subnet_enforce_private_link_service_network_policies  = false
subnet_service_endpoints                              = []