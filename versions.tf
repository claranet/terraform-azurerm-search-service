terraform {
  required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.38"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0"
    }
  }
}
