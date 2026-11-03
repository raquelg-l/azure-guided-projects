terraform {
  required_version = ">= 1.9" # Minimum version of Terraform required to run this configuration

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0" # Minimum version of the AzureRM provider required to run this configuration
    }
  }
}

provider "azurerm" {
  features {} # Required block for the AzureRM provider, even if no specific features are configured  
}