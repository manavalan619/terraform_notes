module "ssh" {
  source               = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/SshKey"
  ssh_algorithm        = var.ssh_algorithm
  ssh_rsa_bits         = var.ssh_rsa_bits
  public_ssh_key       = var.public_ssh_key
  private_key_filename = var.private_key_filename
}
