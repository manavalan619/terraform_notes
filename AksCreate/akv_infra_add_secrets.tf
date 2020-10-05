# ===================================================================
# Keyvault Infra : Creates "acr-password" secret
# ===================================================================
module "acr-password_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "acr-password"
  akv_secret_value      = var.aks_resource_deploy ? module.acr.acr_admin_password[0] : "" 
  resource_depends_on   = [module.acr]
}

# ===================================================================
# Keyvault Infra : Creates "acr-server-login" secret
# ===================================================================
module "acr-server-login_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "acr-server-login"
  akv_secret_value      = var.aks_resource_deploy ? module.acr.acr_login_server[0] : ""
  resource_depends_on   = [module.acr]
}

# ===================================================================
# Keyvault Infra : Creates "acr-user" secret
# ===================================================================
module "acr-user_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "acr-user"
  akv_secret_value      = var.aks_resource_deploy ? module.acr.acr_admin_username[0] : "" 
  resource_depends_on   = [module.acr]
}

# ===================================================================
# Keyvault Infra : Creates "appgwname" secret
# ===================================================================
module "appgwname_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "appgwname"
  akv_secret_value      = var.aks_resource_deploy ? "${element(split("/", module.appgw.appgw_id[0]),8)}" : "" 
  resource_depends_on   = [module.appgw]
}
# ===================================================================
# Keyvault Infra : Creates "clientappid" secret
# ===================================================================
module "clientappid_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "clientappid"
  akv_secret_value      = var.aks_resource_deploy ? data.azurerm_key_vault_secret.aks-aad-client-app-id.value : "" 
  resource_depends_on   = []
}
# ===================================================================
# Keyvault Infra : Creates "clustername" secret
# ===================================================================
module "clustername_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "clustername"
  akv_secret_value      = var.aks_resource_deploy ? "${element(split("/", module.aks.aks_cluster_id[0]),8)}" : "" 
  resource_depends_on   = [module.aks]
}
# ===================================================================
# Keyvault Infra : Creates "k8host" secret
# ===================================================================
module "k8host_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "k8host"
  akv_secret_value      = var.aks_resource_deploy ? module.aks.aks_kube_config[0].0.host : "" 
  resource_depends_on   = [module.aks]
}
# ===================================================================
# Keyvault Infra : Creates "resourcegroup" secret
# ===================================================================
module "resourcegroup_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "resourcegroup"
  akv_secret_value      = var.aks_resource_deploy ? data.azurerm_resource_group.project_resource_group.name : "" 
  resource_depends_on   = []
}
# ===================================================================
# Keyvault Infra : Creates "servappid" secret
# ===================================================================
module "servappid_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "servappid"
  akv_secret_value      = var.aks_resource_deploy ? data.azurerm_key_vault_secret.aks-aad-server-app-id.value : "" 
  resource_depends_on   = []
}
# ===================================================================
# Keyvault Infra : Creates "servpasswd" secret
# ===================================================================
module "servpasswd_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "servpasswd"
  akv_secret_value      = var.aks_resource_deploy ? data.azurerm_key_vault_secret.aks-aad-server-app-psw.value : "" 
  resource_depends_on   = []
}
# ===================================================================
# Keyvault Infra : Creates "spappid" secret
# ===================================================================
module "spappid_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "spappid"
  akv_secret_value      = var.aks_resource_deploy ? data.azurerm_key_vault_secret.aks-sp-client-id.value : "" 
  resource_depends_on   = []
}
# ===================================================================
# Keyvault Infra : Creates "sppasswd" secret
# ===================================================================
module "sppasswd_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "sppasswd"
  akv_secret_value      = var.aks_resource_deploy ? data.azurerm_key_vault_secret.aks-sp-psw.value : "" 
  resource_depends_on   = []
}
# ===================================================================
# Keyvault Infra : Creates "sshprivate" secret
# ===================================================================
module "sshprivate_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "sshprivate"
  akv_secret_value      = var.aks_resource_deploy ? module.aks.private_key_pem[0] : "" 
  resource_depends_on   = [module.aks]
}
# ===================================================================
# Keyvault Infra : Creates "sshpublic" secret
# ===================================================================
module "sshpublic_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "sshpublic"
  akv_secret_value      = var.aks_resource_deploy ? module.aks.public_key_openssh[0] : "" 
  resource_depends_on   = [module.aks]
}
# ===================================================================
# Keyvault Infra : Creates "subscriptionaks" secret
# ===================================================================
module "subscriptionaks_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "subscriptionaks"
  akv_secret_value      = var.aks_resource_deploy ? data.azurerm_client_config.current.subscription_id : "" 
  resource_depends_on   = []
}
# ===================================================================
# Keyvault Infra : Creates "tenantid" secret
# ===================================================================
module "tenantid_secret" {
  resource_deploy       = var.aks_resource_deploy 
  source                = "../KeyVaultSecretTest"
  akv_key_vault_id      = length(var.akv_infra_id) == 0 ? [] : [var.akv_infra_id]
  akv_secret_name       = "tenantid"
  akv_secret_value      = var.aks_resource_deploy ? data.azurerm_client_config.current.tenant_id : "" 
  resource_depends_on   = []
}