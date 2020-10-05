# ======================================================
# Data sources
# ======================================================
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

# ======================================================
# Creates subnet
# ======================================================

resource "azurerm_subnet" "subnet" {

  // Prevent from update the azurerm_subnet resource in terraform plan
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

  name                                           = var.subnet_name
  resource_group_name                            = data.azurerm_resource_group.project_resource_group.name
  virtual_network_name                           = var.subnet_virtual_network_name
  address_prefixes                               = var.subnet_address_prefix
  enforce_private_link_endpoint_network_policies = var.subnet_enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.subnet_enforce_private_link_service_network_policies
  service_endpoints                              = var.subnet_service_endpoints

  dynamic "delegation" {
    for_each = [for s in var.subnet_service_delegations :
      {
        name = s.name                             // (Required) A name for this delegation.
        service_delegation = {
          name    = s.service_delegation.name     // (Required) The name of service to delegate to
          actions = s.service_delegation.actions  // A list of Actions which should be delegated.
        }
    }]
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }

  # dynamic "delegation" {
  #     for_each = contains(keys(var.subnet_service_delegations), each.key) ? [1] : []
  #     content { 
  #       name = "${each.key}-delegation"
  #       service_delegation {
  #         name    = var.subnet_delegations[each.key]
  #         actions = var.subnet_delegations_actions[var.subnet_service_delegations[each.key]]
  #       }
  #     }
  #   }



  depends_on = [var.resource_depends_on]
  count      = (var.resource_deploy ? 1 : 0)
}