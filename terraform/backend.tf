terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstorage1account1devops"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}