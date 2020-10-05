terraform {
  # required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "RG-TF-MGT-AEHN-DEV"
    storage_account_name = "saterraformaa37chqfz"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}
