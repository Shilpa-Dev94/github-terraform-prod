terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-prod"
    storage_account_name = "sttfstateprod12345" 
    container_name       = "tfstate"
    key                  = "dev.rg.tfstate"
  }
}