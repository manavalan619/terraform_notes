# terraform-ssh-variables
variable "ssh_algorithm" {
  type        = string
  description = "(Required) The name of the algorithm to use for the key. Currently-supported values are RSA and ECDSA."
}
variable "ssh_rsa_bits" {
  type        = number
  description = "(Optional) When algorithm is RSA, the size of the generated RSA key in bits. Defaults to 2048."
}
variable "public_ssh_key" {
  type        = string
  description = "A custom ssh key to control access to the AKS cluster"
}
variable "private_key_filename" {
  type        = string
  description = "(Required) The path of the file to create."
}
