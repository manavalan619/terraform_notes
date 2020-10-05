terraform {
  # required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "RG-TF-MGT-DV-NE-TGS-DAVIDTEST"
    storage_account_name = "terraformaci1ykver"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}
