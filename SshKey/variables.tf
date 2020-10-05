variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}
# ======================================================
# TLS Private Key - Variables
# ======================================================
variable "ssh_algorithm" {
  type        = string
  description = "(Required) The name of the algorithm to use for the key. Currently-supported values are RSA and ECDSA."
}
variable "ssh_ecdsa_curve" {
  type        = string
  description = "(Optional) When algorithm is ECDSA, the name of the elliptic curve to use. May be any one of P224, P256, P384 or P521, with P224 as the default."
}
variable "ssh_rsa_bits" {
  type        = number
  description = "(Optional) When algorithm is RSA, the size of the generated RSA key in bits. Defaults to 2048."
}
# variable "public_ssh_key" {
#   type        = string
#   description = "A custom ssh key to control access to the AKS cluster"
# }
# variable "private_key_filename" {
#   type        = string
#   description = "(Required) The path of the file to create."
# }
