# ========================================================================
# Generates a Random String
# ========================================================================
resource "random_string" "password" {
  length = 16
}

# ========================================================================
# Generates a Random String
# ========================================================================
locals {
  sps_to_create = var.create_for_rbac == true ? 1 : 0
  sp_password   = sha256(bcrypt(random_string.password.result))
}

# ========================================================================
# Creates an Application within Azure Active Directory. (AAD)
# ========================================================================
resource "azuread_application" "sp" {
  count = local.sps_to_create
  name  = var.display_name
}

# ========================================================================
# Creates an SP associated with an Application within AAD.
# ========================================================================
resource "azuread_service_principal" "sp" {
  count          = local.sps_to_create
  application_id = azuread_application.sp[0].application_id
}

# ========================================================================
# Assigns the given Principal (User or Application) to a given Role.
# ========================================================================
resource "azurerm_role_assignment" "sp" {
  role_definition_name = var.role_name
  principal_id         = var.create_for_rbac == true ? azuread_service_principal.sp[0].object_id : var.object_id
  scope                = var.role_scope
}

# ========================================================================
# Generates a Password associated with the SP
# ========================================================================
resource "azuread_service_principal_password" "sp" {
  count                = local.sps_to_create
  service_principal_id = azuread_service_principal.sp[0].object_id
  value                = local.sp_password
  end_date_relative    = var.sp_pwd_end_date_relative

  lifecycle {
    ignore_changes = all
  }
}
