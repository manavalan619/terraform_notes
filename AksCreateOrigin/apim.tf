// notes on Private Link Endpoints for subnets
// (NSG), are not supported for Private Link Endpoints or Private Link Services. 
// In order to deploy a Private Link Endpoint on a given subnet, 
// you must set the enforce_private_link_endpoint_network_policies attribute to true. 
// This setting is only applicable for the Private Link Endpoint, for all other resources 
// in the subnet access is controlled based via the Network Security Group which can be configured 
// using the azurerm_subnet_network_security_group_association resource.

// more info here : https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview
// limitations : https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview#limitations

// use the module APIM in the target
resource "azurerm_api_management" "apim" {
  count               = var.deploy_aks ? 1 : 0
  name                = lower("apim-${var.short_project_name}-${var.env_code}") 
  location            = data.azurerm_resource_group.project_resource_group.location 
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  publisher_name      = lower("apim-publisher-${var.short_project_name}-${var.env_code}") 
  publisher_email     = "example@total.com"         // "company@toto.io"
  sku_name            = var.apim_sku_name       // "Developer_1"  in AnteProd "Premium_2" in Prod

  # sign_in {

  # }

  # sign_up {
  #   enabled = false
  #   terms_of_service {
  #     consent_required = false 
  #     enabled = false
  #     text    = 
  #   }
  # }

  # virtual_network_type = "Internal" // (Optional) The type of virtual network you want to use, valid values include: None, External, Internal

  # virtual_network_configuration {
  #     subnet_id = data.azurerm_subnet.apimsubnet[0].id
  # }


  # hostname_configuration {
  #   management {
  #     host_name = 
  #   }
  #   portal {
  #     host_name =
  #   }
  #   developer_portal {
  #     host_name =
  #   }
  #   proxy {
  #     host_name                    = // "apim.demo.com"
  #     // for end-to-end TLS (for a future target)
  #     // pas de certificat au niveau de l'apim (pour le moment)
  #     // certificate                  = filebase64(var.apim_ssl_certificate_path) 
  #     // certificate_password         = var.apim_ssl_certificate_password
  #     //default_ssl_binding          = true
  #     //negotiate_client_certificate = false
  #   }

  #   scm {
  #     host_name = 
  #   }

  # } 

  policy {
    xml_content = <<XML
    <policies>
      <inbound />
      <backend />
      <outbound />
      <on-error />
    </policies>
XML
  }

  depends_on = [azurerm_private_dns_zone_virtual_network_link.vnetlink]

}

// for a demo
# resource "azurerm_api_management_api" "demo-users-api" {
#   name = "demo-users-api"
#   resource_group_name = "demo-resource-group"
#   api_management_name = azurerm_api_management.demo-apim.name
#   revision = "1"
#   display_name = "Demo Users API"
#   path = "api/v1/users"
#   protocols = ["https"]
#   service_url = "https://backend.mydomain.com/api/v1/users"
# }

# resource "azurerm_api_management_api_operation" "create-user-api" {
#   method = "POST"
#   url_template = "/users"
#   // ... other properties
# }

# resource "azurerm_api_management_api_operation" "delete-user" {
#   method = "DELETE"
#   url_template = "/users"
#   // ... other properties
# }
