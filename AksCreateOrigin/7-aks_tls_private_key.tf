# ==================================================================================
# Creates a public key for linux ssh worker nodes
# ==================================================================================
resource "tls_private_key" "aks_ssh_key" {
  # count       = var.deploy_aks ? 1 : 0
  # count = 1
  count       = var.deploy_aks ? 1 : 0
  algorithm   = "RSA"
  ecdsa_curve = "P224"
  rsa_bits    = 4096
}
// tmp manage a local private_key
# resource "local_file" "private_key" {
#   count    = var.public_ssh_key == "" ? 1 : 0
#   content  = tls_private_key.private_key.private_key_pem
#   filename = "./private_ssh_key"
# }
