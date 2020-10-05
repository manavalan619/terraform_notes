# The default provider configuration
provider "azurerm" {
  version = "~> 2.0"
  features {}
}

# Additional provider configuration
provider "azurerm" {
  alias  = "subscription_total_it"
  subscription_id = "8926a4c9-f728-4c15-8df3-92c580ea6008"
  version = "~> 2.0"
  features {}
}

