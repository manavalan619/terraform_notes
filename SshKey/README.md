# Module Azure SshKey

`The development of this module is currently in progress`

## Usage

### Module Definitions

- Azure ssh key module location : providers/azure/SshKey

  ```hcl
  module "ssh" {
  source               = "git::https://___GitToken___@dev.azure.com/TotalDataLake/REF-TF-MODULES/_git/REF-TF-MODULES//providers/azure/SshKey"
  ssh_algorithm        = var.ssh_algorithm
  ssh_rsa_bits         = var.ssh_rsa_bits
  public_ssh_key       = var.public_ssh_key
  private_key_filename = var.private_key_filename
  }
  ```

## Inputs

Supported arguments for this module are available in [variables.tf](variables.tf).

```hcl
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
```

## Outputs

The following variables are available as module outputs variables

```hcl
output "public_ssh_key" {
  value       = module.ssh.public_ssh_key
  description = "The public key data in OpenSSH authorized_keys format, if the selected private key format is compatible. All RSA keys are supported, and ECDSA keys with curves P256, P384 and P521 are supported. This attribute is empty if an incompatible ECDSA curve is selected."
}
```
