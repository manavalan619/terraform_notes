# # # ==================================================================================================
# # # Creates A Dedicated "infra" KeyVault 
# # # Contains all secrets needed to make working the CCE Azure Devops pipelines (Orchestrator)
# # # 
# # # tmp coded here with a resource azurerm_key_vault
# # # in the target : use a module keyvault 
# # # ==================================================================================================
# # # resource "azurerm_key_vault" "key_vault_infra" {
# # #   name                = local.akv_infra_target_name // "akv-infra-${lower(var.env_code)}-${lower(var.short_project_name)}"
# # #   resource_group_name = data.azurerm_resource_group.project_resource_group.name
# # #   location            = data.azurerm_resource_group.project_resource_group.location
# # #   sku_name            = var.sku_key_vault_infra
# # #   tenant_id           = data.azurerm_client_config.current.tenant_id

# # #   access_policy {
# # #     tenant_id = data.azurerm_client_config.current.tenant_id
# # #     object_id = data.azurerm_key_vault_secret.aks-sp-client-id.value // "${data.azuread_service_principal.sp-aks.id}"
# # #     # sp AKS
# # #     key_permissions = [
# # #       "backup",
# # #       "create",
# # #       "decrypt",
# # #       "delete",
# # #       "encrypt",
# # #       "get",
# # #       "import",
# # #       "list",
# # #       "purge",
# # #       "recover",
# # #       "restore",
# # #       "sign",
# # #       "unwrapKey",
# # #       "update",
# # #       "verify",
# # #       "wrapKey",
# # #     ]

# # #     secret_permissions = [
# # #       "backup",
# # #       "delete",
# # #       "get",
# # #       "list",
# # #       "purge",
# # #       "recover",
# # #       "restore",
# # #       "set",
# # #     ]

# # #     certificate_permissions = [
# # #       "Get",
# # #       "List",
# # #       "ManageIssuers",
# # #       "GetIssuers",
# # #       "ListIssuers",
# # #       "SetIssuers",
# # #       "DeleteIssuers",
# # #       "Purge",
# # #       "Update",
# # #       "Create",
# # #       "Import",
# # #       "Delete",
# # #       "Recover",
# # #       "Backup",
# # #       "Restore",
# # #       "ManageContacts",
# # #     ]
# # #   }

# # #   access_policy {
# # #     tenant_id = data.azurerm_client_config.current.tenant_id
# # #     object_id = "f2836502-9d5b-4483-87d2-79420930b289" // corresponds to "ZG-CCOE" AAD GROUP

# # #     # ZG-CCOE
# # #     key_permissions = [
# # #       "backup",
# # #       "create",
# # #       "decrypt",
# # #       "delete",
# # #       "encrypt",
# # #       "get",
# # #       "import",
# # #       "list",
# # #       "purge",
# # #       "recover",
# # #       "restore",
# # #       "sign",
# # #       "unwrapKey",
# # #       "update",
# # #       "verify",
# # #       "wrapKey",
# # #     ]

# # #     secret_permissions = [
# # #       "backup",
# # #       "delete",
# # #       "get",
# # #       "list",
# # #       "purge",
# # #       "recover",
# # #       "restore",
# # #       "set",
# # #     ]

# # #     certificate_permissions = [
# # #       "Get",
# # #       "List",
# # #       "ManageIssuers",
# # #       "GetIssuers",
# # #       "ListIssuers",
# # #       "SetIssuers",
# # #       "DeleteIssuers",
# # #       "Purge",
# # #       "Update",
# # #       "Create",
# # #       "Import",
# # #       "Delete",
# # #       "Recover",
# # #       "Backup",
# # #       "Restore",
# # #       "ManageContacts",
# # #     ]
# # #   }

# # #   access_policy {
# # #     tenant_id = data.azurerm_client_config.current.tenant_id
# # #     object_id = "b1777aec-3162-4e54-9858-1cbfbbb5ec0a" // corresponds to "ZG-AZR-TGS-TEAMDEVOPS-DEVELOPER" AAD GROUP

# # #     # ZG-CCOE
# # #     key_permissions = [
# # #       "backup",
# # #       "create",
# # #       "decrypt",
# # #       "delete",
# # #       "encrypt",
# # #       "get",
# # #       "import",
# # #       "list",
# # #       "purge",
# # #       "recover",
# # #       "restore",
# # #       "sign",
# # #       "unwrapKey",
# # #       "update",
# # #       "verify",
# # #       "wrapKey",
# # #     ]

# # #     secret_permissions = [
# # #       "backup",
# # #       "delete",
# # #       "get",
# # #       "list",
# # #       "purge",
# # #       "recover",
# # #       "restore",
# # #       "set",
# # #     ]

# # #     certificate_permissions = [
# # #       "Get",
# # #       "List",
# # #       "ManageIssuers",
# # #       "GetIssuers",
# # #       "ListIssuers",
# # #       "SetIssuers",
# # #       "DeleteIssuers",
# # #       "Purge",
# # #       "Update",
# # #       "Create",
# # #       "Import",
# # #       "Delete",
# # #       "Recover",
# # #       "Backup",
# # #       "Restore",
# # #       "ManageContacts",
# # #     ]
# # #   }

# # #   enabled_for_disk_encryption = true

# # #   tags = data.azurerm_resource_group.project_resource_group.tags

# # # }

# module "key_vault_infra" {
#   source                              = "../KeyVaultSimple/"
#   project_resource_group_name         = data.azurerm_resource_group.project_resource_group.name
#   project_name                        = var.project_name
#   short_project_name                  = var.short_project_name
#   location_code                       = "WE"
#   env_code                            = var.env_code
#   resource_index                      = "inf"

#   akv_sku_name                        = "standard"
#   akv_enabled_for_deployment          = false
#   akv_soft_delete_enabled             = false
#   akv_purge_protection_enabled        = false
#   akv_enabled_for_template_deployment = false
#   akv_enabled_for_disk_encryption     = true
#   resource_deploy                     = var.resource_deploy_akv_infra

# }

# # =======================================================
# # Adds access policy to CCE AAD Group and TGITS DEF GROUP
# # =======================================================
# module "akv_access_policy" {
#   source                            = "../KeyVaultAccessPolicy/"
#   # akv_access_policy_key_vault_id    =   var.resource_deploy ? azurerm_key_vault.akv[0].id : ""
#   akv_access_policy_key_vault_id    = var.resource_deploy_akv_infra ? module.key_vault_infra[0].akv_id : ""
#   akv_access_policy_object_ids      = var.resource_deploy_akv_infra ? ["f2836502-9d5b-4483-87d2-79420930b289","b1777aec-3162-4e54-9858-1cbfbbb5ec0a"] : []  // f2836502-9d5b-4483-87d2-79420930b289 = "ZG-CCOE" AAD GROUP ; b1777aec-3162-4e54-9858-1cbfbbb5ec0a = ZG-AZR-TGS-TEAMS-DEVELOPER
#   akv_access_policy_security_level  = "Owner" 
#   resource_depends_on               = [module.key_vault_infra.akv_id]
# }

# # # ======================================================
# # # Creates Key Vault Access Policy
# # # ======================================================
# # resource "azurerm_key_vault_access_policy" "akv_access_policy" {
# #   count              = length(var.akv_access_policy_object_ids)

# #   key_vault_id       = var.akv_access_policy_key_vault_id
# #   tenant_id          = data.azurerm_client_config.current.tenant_id
# #   object_id          = var.akv_access_policy_object_ids[count.index]

# #   key_permissions    = lookup(var.akv_access_policy_key_permissions   , var.akv_access_policy_security_level) 
# #   secret_permissions = lookup(var.akv_access_policy_secret_permissions, var.akv_access_policy_security_level)
# #   certificate_permissions = lookup(var.akv_access_policy_certificate_permission, var.akv_access_policy_security_level)

# #   // (Temporary) unmanaged attributes (will be included in the scope later) :
# #   # application_id      = var.akv_access_policy_application_id
# #   # storage_permissions = var.akv_access_policy_storage_permissions

# # }

# # // Store all secrets required by the CCE Azure DevOps pipelines (orchestrator)
# resource "azurerm_key_vault_secret" "spappid" { // ?
#   name         = "spappid" 
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = data.azurerm_key_vault_secret.aks-sp-client-id.value //"${var.sp_app_id}"
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "sppasswd" { //OK
#   name         = "sppasswd"
#   key_vault_id = module.key_vault_infra[0].akv_id //azurerm_key_vault.key_vault_infra.id
#   value        = data.azurerm_key_vault_secret.aks-sp-psw.value //"${var.sp_secret}"
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "servappid" { // OK
#   name         = "servappid"
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = data.azurerm_key_vault_secret.aks-aad-server-app-id.value //"${var.server_app_id}"
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "clientappid" { //OK
#   name         = "clientappid"
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = data.azurerm_key_vault_secret.aks-aad-client-app-id.value // "${var.client_app_id}"
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "servpasswd" { //OK
#   name         = "servpasswd"
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = data.azurerm_key_vault_secret.aks-aad-server-app-psw.value // "${var.server_app_secret}"
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "sshpublic" { //OK
#   name         = "sshpublic"
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = tls_private_key.aks_ssh_key[0].public_key_openssh
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "sshprivate" { //OK
#   name         = "sshprivate"
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = tls_private_key.aks_ssh_key[0].private_key_pem
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "clustername" { //OK
#   name         = "clustername"
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = azurerm_kubernetes_cluster.aks[0].name
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "appgwname" { //OK
#   name         = "appgwname"
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = azurerm_application_gateway.aks_app_gw[0].name
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "subscriptionaks" {
#   name         = "subscriptionaks"
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = data.azurerm_client_config.current.subscription_id
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "resourcegroup" {
#   name         = "resourcegroup"
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = data.azurerm_resource_group.project_resource_group.name
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "tenantid" {
#   name         = "tenantid"
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = data.azurerm_client_config.current.tenant_id
#   depends_on   = [module.key_vault_infra]
# }
# resource "azurerm_key_vault_secret" "k8host" {
#   name         = "k8host"
#   key_vault_id = module.key_vault_infra[0].akv_id // azurerm_key_vault.key_vault_infra.id
#   value        = azurerm_kubernetes_cluster.aks[0].kube_config.0.host
#   depends_on   = [module.key_vault_infra]
# }