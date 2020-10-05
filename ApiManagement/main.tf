# ======================================================
# Data sources
# ======================================================
data "azurerm_resource_group" "project_resource_group" {
  name = var.project_resource_group_name
}

// Retrieve SUFFIX secret value for akv target name
data "azurerm_key_vault" "akv_tf" {
  name                = local.akv_tf_name
  resource_group_name = local.rg_tf_name
}
data "azurerm_key_vault_secret" "suffix_value" {
  name         = "SUFFIX"
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

# ======================================================
# Manages internal rules and resources naming rules 
# ======================================================
locals {
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // Apim naming convention
  resource_name = lower("apim-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}")
}

# ======================================================
# APIM resources
# ======================================================

resource "azurerm_api_management" "apim" {

  lifecycle {
    ignore_changes = [
      policy,
    ]
  } 
  count               = (var.resource_deploy ? 1 : 0)
  name                = local.resource_name
  location            = data.azurerm_resource_group.project_resource_group.location
  resource_group_name = data.azurerm_resource_group.project_resource_group.name

  publisher_name      = var.apim_publisher_name   //(Required) The name of publisher/company.
  publisher_email     = var.apim_publisher_email  //(Required) The email of publisher/company.

  // (Required) sku_name is a string consisting of two parts separated by an underscore(_). 
  // The fist part is the name, valid values include: Consumption, Developer, Basic, Standard and Premium. 
  // The second part is the capacity
  sku_name            = var.apim_sku_name    // "Developer_1"  in AnteProd "Premium_2" (minimum) in Prod
  policy {
    xml_content = var.apim_xml_content      // The XML Content for this Policy.
  }

  // TODO : Integrate the creation of the APIM UAI (User Assigned Identity) in INIT_PROJECT pwsh scripts
  identity {
    // (Required) Type of Managed Service Identity that should be configured on this APIM Service. 
    // Possible values = SystemAssigned, UserAssigned or SystemAssigned, UserAssigned (to enable both).
    type = "UserAssigned"   
    // (Optional) A list of IDs for User Assigned Managed Identity resources to be assigned.              
    identity_ids = var.apim_identity_ids 
  }
  
  # sign_in {
  #   enabled = false             // (Required) Should anonymous users be redirected to the sign in page?
  # }

  # sign_up {
  #   enabled = false             // (Required) Can users sign up on the development portal?
  #   terms_of_service {
  #     consent_required = false  // (Required) Should the user be asked for consent during sign up?
  #     enabled = false           // (Required) Should Terms of Service be displayed during sign up?.
  #     text    = "TOTAL Sign Up - Terms of Service - Agreement"  // (Required) The Terms of Service which users are required to agree to in order to sign up.
  #   }
  # }

  virtual_network_type = var.apim_vnet_type           // "External" for DrillX   ; (Optional) The type of VNET you want to use (None, External, Internal)
  
  virtual_network_configuration {
    // virtual_network_configuration
      subnet_id = var.apim_vnet_configuration_subnet_id // (Required) The subnetID that will be used for the APIM.
      // Usage : when consuming the module ApiManagement : 
      // subnet_id = var.aks_resource_deploy ? module.aks_apim_subnet.subnet_id[0] : "" 
  }

  # # begin hostname_configuration block

  # // Note : 
  # // The "APIM User Assigned Identity" is used to retrieve APIM certificates from the Mgt AKV
  # // --> Then an identity block must be specified for end to end TLS in APIM resource.

  # // To manage certificates on apim and then manage end to end TLS in APIM resource, 
  # // we need to declare these attributes in the blocks management, portal, developer_portal and scm
  # // not in scope for DrillX
  #     // key_vault_id // (Optional) The ID of the Key Vault Secret containing the SSL Certificate, which must be should be of the type application/x-pkcs12.
  #     // certificate                  = filebase64(var.apim_ssl_certificate_path) 
  #     // certificate_password         = var.apim_ssl_certificate_password
  #     // negotiate_client_certificate = false // (Optional) Should Client Certificate Negotiation be enabled for this Hostname? Defaults to false. 
  
  # Mandary if you want a healthy apim backend
  # hostname_configuration {
  #   management {
  #     host_name = var.apim_hostname_configuration_management_host_name // (Required) The Hostname to use for the Management API.
  #   }
  #   portal {
  #     host_name = var.apim_hostname_configuration_portal_host_name
  #   }
  #   developer_portal {
  #     host_name = var.apim_hostname_configuration_developer_portal_host_name
  #   }
  #   proxy {
  #     host_name = var.apim_hostname_configuration_proxy_host_name // "apim.demo.com"
  #   }
  #   scm {
  #     host_name = var.apim_hostname_configuration_scm_host_name
  #   }
  # } # end hostname_configuration block

  tags        = data.azurerm_resource_group.project_resource_group.tags
  depends_on  = [var.resource_depends_on]

}
