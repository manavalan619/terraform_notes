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

# Retreive appgw_ssl certificate in the key
data "azurerm_key_vault_secret" "appgw_ssl_certificate" {
  name         = var.appgw_ssl_certificate_name
  key_vault_id = data.azurerm_key_vault.akv_tf.id
}

locals {
  rg_tf_name  = upper("RG-TOTAL-TF-MGT-TGS-${var.env_code}")
  akv_tf_name = lower("akv-tf-${var.env_code}-${var.location_code}-${var.project_name}")

  // Application Gateway naming convention
  resource_name         = lower("appgw-${var.env_code}-${var.short_project_name}-${data.azurerm_key_vault_secret.suffix_value.value}-${var.resource_index}")
}

# ======================================================
# Creating Application Gateway
# ======================================================
resource "azurerm_application_gateway" "appgw" {
  count               = (var.resource_deploy ? 1 : 0)
  name                = local.resource_name 
  resource_group_name = data.azurerm_resource_group.project_resource_group.name
  location            = data.azurerm_resource_group.project_resource_group.location

  sku {
    name = var.appgw_sku_name
    tier = var.appgw_sku_tier
  }
  autoscale_configuration {
    min_capacity = var.appgw_autoscale_configuration_min_capacity  // 2 by default
    max_capacity = var.appgw_autoscale_configuration_max_capacity  // 10 by default
  }
  waf_configuration {
    enabled              = true
    firewall_mode        = "Prevention"
    rule_set_type        = "OWASP"
    rule_set_version     = "3.0"
    file_upload_limit_mb = 500
  }
  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.resource_deploy ? var.appgw_gateway_ip_configuration_subnet_id : ""
  }
  frontend_port {
    name = lower("${var.short_project_name}-${var.env_code}-frontend-port")
    port = 443
  }
  frontend_ip_configuration {
    name                          = lower("${var.short_project_name}-${var.env_code}-frontend")
    public_ip_address_id          = var.resource_deploy ? var.appgw_frontend_ip_configuration_public_ip_address_id : ""
    private_ip_address_allocation = "Dynamic"
  }
  backend_address_pool {
    name         = lower("${var.short_project_name}-${var.env_code}-api")
    ip_addresses = var.appgw_backend_address_pool_ip_addresses            // private ip adress to choose in the CIDR range of the apim subnet
  }

 // Http Listeners blocks
  http_listener {
    name                            = lower("${var.short_project_name}-${var.env_code}-portal-listener")
    frontend_ip_configuration_name  = lower("${var.short_project_name}-${var.env_code}-frontend")
    frontend_port_name              = lower("${var.short_project_name}-${var.env_code}-frontend-port")
    protocol                        = "Https"
    # host_name                       = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal.azr.tgscloud.net"
    host_name                       = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal.${lower(var.appgw_target_domain_name)}"
    # host_name                       = var.appgw_target_domain_name
    require_sni                     = true
    ssl_certificate_name            = data.azurerm_key_vault_secret.appgw_ssl_certificate.name          // "azrtgscloudnet"
  }
  http_listener {
    name                           = lower("${var.short_project_name}-${var.env_code}-proxy-listener")
    frontend_ip_configuration_name = lower("${var.short_project_name}-${var.env_code}-frontend")
    frontend_port_name             = lower("${var.short_project_name}-${var.env_code}-frontend-port")
    protocol                       = "Https"
    # host_name                      = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy.azr.tgscloud.net"
    host_name                      = lower("${var.short_project_name}-${var.env_code}-proxy.${var.appgw_target_domain_name}")
    require_sni                    = true
    ssl_certificate_name           = data.azurerm_key_vault_secret.appgw_ssl_certificate.name
  }

  // TODO : Add SCM http_listener block here

  // request_routing_rules blocks. (They are not path based rules for the moment ; TODO : study if path based rule is needed for the target)
  
  // request_routing_rules for apim developer portal
  request_routing_rule {
    backend_address_pool_name  = lower("${var.short_project_name}-${var.env_code}-api")
    backend_http_settings_name = lower("${var.short_project_name}-${var.env_code}-portal-http_setting")
    http_listener_name         = lower("${var.short_project_name}-${var.env_code}-portal-listener")
    name                       = lower("${var.short_project_name}-${var.env_code}-portal-rule")
    rule_type                  = "Basic"
  }
  // request_routing_rules for appgw
  request_routing_rule {
    backend_address_pool_name  = lower("${var.short_project_name}-${var.env_code}-api")
    backend_http_settings_name = lower("${var.short_project_name}-${var.env_code}-proxy-http_setting")
    http_listener_name         = lower("${var.short_project_name}-${var.env_code}-proxy-listener")
    name                       = lower("${var.short_project_name}-${var.env_code}-proxy-rule")
    rule_type                  = "Basic"
  }
  // TODO : Add SCM request_routing_rule block here

  # backend_http_settings blocks

  // backend_http_settings for apim developer portal
  backend_http_settings {
    name                  = lower("${var.short_project_name}-${var.env_code}-portal-http_setting")
    cookie_based_affinity = "Disabled"
    port                  = 443
    probe_name            = lower("${var.short_project_name}-${var.env_code}-portal-probe")
    protocol              = "Https"
    request_timeout       = 10
  }
  // backend_http_settings for appwg
  backend_http_settings {
    name                  = lower("${var.short_project_name}-${var.env_code}-proxy-http_setting")
    cookie_based_affinity = "Disabled"
    port                  = 443
    probe_name            = lower("${var.short_project_name}-${var.env_code}-proxy-probe")
    protocol              = "Https"
    request_timeout       = 10
  }
 // TODO : Add SCM backend_http_settings block here if needed (see with Brown his point point of of view)

  # Custom probes blocks
  // appgw probe
  probe {
    # host                                      = "${lower(var.short_project_name)}-${lower(var.env_code)}-proxy.azr.tgscloud.net"
    # host                                      = lower("${lower(var.short_project_name)}-${lower(var.env_code)}-proxy.${lower(var.appgw_target_domain_name)}")
    host                                      = lower("${var.short_project_name}-${var.env_code}-proxy.${var.appgw_target_domain_name}")
    
    //
    // Prepare the target host name regardiing the CN of the appgw certificate
    //
    # host = lower("proxy.${var.appgw_target_domain_name}")
    // HP : C=FR, ST=Hauts-De-Seine, L=COURBEVOIE, STREET=2 PLACE JEAN MILLIER, STREET=LA DÉFENSE 6, O=TOTAL SA, OU=TOTAL SA, CN=preprod.drillx.total
    // P  : C=FR, ST=Hauts-De-Seine, L=COURBEVOIE, STREET=2 PLACE JEAN MILLIER, STREET=LA DÉFENSE 6, O=TOTAL SA, OU=TOTAL SA, CN=www.drillx.total

    interval                                  = 30 
    minimum_servers                           = 0 
    name                                      = lower("${var.short_project_name}-${var.env_code}-proxy-probe") 
    path                                      = "/status-0123456789abcdef" // default health endpoint hosted on all the API Management services
    pick_host_name_from_backend_http_settings = false 
    protocol                                  = "Https" 
    timeout                                   = 30 
    unhealthy_threshold                       = 3 

    match {
        body = ""
        status_code = [
            "200-399",
        ] 
    }
  }
  // appgw apim developer portal probe
  probe {
      # host                                      = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal.${var.dns_zone}" 
      # host                                      = "${lower(var.short_project_name)}-${lower(var.env_code)}-portal.azr.tgscloud.net"
      host                                      = lower("${var.short_project_name}-${var.env_code}-portal.${var.appgw_target_domain_name}")
      interval                                  = 30 
      minimum_servers                           = 0 
      name                                      = lower("${var.short_project_name}-${var.env_code}-portal-probe")
      path                                      = "/signin" 
      pick_host_name_from_backend_http_settings = false 
      protocol                                  = "Https"
      timeout                                   = 30 
      unhealthy_threshold                       = 3 

      match {
          body = ""
          status_code = [
              "200-399",
          ] 
      }
  }
  // TODO : Add SCM custom probe block here
 
  identity {
    type         = "UserAssigned"
    identity_ids = var.resource_deploy ? var.appgw_identity_ids : [] // [azurerm_user_assigned_identity.appgw_user_assigned_identity[0].id] 
  }

  ssl_certificate {
    name                = data.azurerm_key_vault_secret.appgw_ssl_certificate.name //var.appgw_ssl_certificate_name    // var.ssl_certificate_name //"azrtgscloudnet" // data.azurerm_key_vault_secret.appgw_certificate.name     // " "
    #data = "${filebase64("/home/mathieu/devops_INFRA/LocalTest/modules/01-create-env/my1.pfx")}"
    # data          = "${var.base64Cert}"
    # password      = ""  // password = "9f9LodH2H>(c)M<t"
    key_vault_secret_id = data.azurerm_key_vault_secret.appgw_ssl_certificate.id // var.ssl_certificate_akv_secret_id  
  }



  // tmp dynamic blocks  : TO BE TESTED as a potential new feature in the target
  # dynamic "http_listener" {
  #   for_each = var.http_listener != null ? [var.http_listener] : []
  #   content {
  #     name                           = http_listener.value.name
  #     frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
  #     frontend_port_name             = http_listener.value.frontend_port_name
  #     protocol                       = http_listener.value.protocol
  #     host_name                      = http_listener.value.host_name
  #     require_sni                    = http_listener.value.require_sni                      // true by default
  #     ssl_certificate_name           = http_listener.value.ssl_certificate_name 

  #   }
  # }
  # dynamic "request_routing_rule" {
  #   for_each = var.request_routing_rule != null ? [var.request_routing_rule] : []
  #   content {
  #     name                       = request_routing_rule.value.name
  #     rule_type                  = request_routing_rule.value.rule_type
  #     http_listener_name         = request_routing_rule.value.http_listener_name
  #     backend_address_pool_name  = request_routing_rule.value.backend_address_pool_name
  #     backend_http_settings_name = request_routing_rule.value.backend_http_settings_name
  #   }
  # }


  # dynamic "backend_http_settings" {
  #   for_each = var.backend_http_settings != null ? [var.backend_http_settings] : []
  #   content {
  #     name                  = backend_http_settings.value.name
  #     cookie_based_affinity = backend_http_settings.value.cookie_based_affinity
  #     path                  = backend_http_settings.value.path
  #     port                  = backend_http_settings.value.port
  #     protocol              = backend_http_settings.value.protocol
  #     request_timeout       = backend_http_settings.value.request_timeout
  #   }
  # }

  # dynamic "probe" {
  #   for_each = var.probe != null ? [var.probe] : []
  #   content {
  #     host                                      = probe.value.host
  #     interval                                  = probe.value.interval
  #     name                                      = probe.value.name
  #     protocol                                  = probe.value.protocol
  #     path                                      = probe.value.path
  #     timeout                                   = probe.value.timeout
  #     unhealthy_threshold                       = probe.value.unhealthy_threshold
  #     pick_host_name_from_backend_http_settings = probe.value.pick_host_name_from_backend_http_settings
  #     dynamic "match" {
  #       for_each = var.match != null ? [var.match] : []
  #       content {
  #         body        = match.value.body
  #         status_code = match.value.status_code
  #       }
  #     }
  #     minimum_servers = probe.value.minimum_servers
  #   }
  # }
  # dynamic "identity" {
  #   for_each = var.identity != null ? [var.identity] : []
  #   content {
  #     identity_ids = identity.value.identity_ids
  #     type         = identity.value.type
  #   }
  # }
  
  tags        = data.azurerm_resource_group.project_resource_group.tags
  depends_on  = [var.resource_depends_on]

}