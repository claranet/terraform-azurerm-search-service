terraform {
  experiments      = [module_variable_optional_attrs]
  required_version = ">= 0.14, < 1.3"
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
