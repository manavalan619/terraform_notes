
# ========================================================================
# AKS Admin private ssh key - Output
# ========================================================================
output "public_key_openssh" {
  description = "The public key data in OpenSSH authorized_keys format, if the selected private key format is compatible. All RSA keys are supported, and ECDSA keys with curves P256, P384 and P521 are supported. This attribute is empty if an incompatible ECDSA curve is selected."
  value       = [for instance in tls_private_key.ssh : instance.public_key_openssh]
}
output "private_key_pem" {
  description = "The private key data in PEM format."
  value       = [for instance in tls_private_key.ssh : instance.private_key_pem]
}