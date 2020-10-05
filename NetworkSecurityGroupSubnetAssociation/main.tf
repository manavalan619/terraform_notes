# ======================================================
# Creates Network security group / Subnet Assiciation
# ======================================================
resource "azurerm_subnet_network_security_group_association" "ansg_subnet" {
  count                     = (var.resource_deploy ? 1 : 0)
  subnet_id                 = var.ansg_subnet_subnet_id
  network_security_group_id = var.ansg_subnet_network_security_group_id

  depends_on                = [var.resource_depends_on]

}