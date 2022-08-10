terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.75.0"
    }
  }
}

provider "azurerm" {
  features {}

  # More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
	

}

resource "random_string" "random_suffix" {
	length = 5
	special = false
	override_special = "/@$"
}


resource "azurerm_resource_group" "hcmx-rg" {
  name ="hcmx-rg-${random_string.random_suffix.result}"
 location            = var.location
 tags = {
    Environment = "Terraform"
    Team        = "DevOps"
  }
}

