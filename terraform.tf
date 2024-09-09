terraform {
  required_version = "~> 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.74"
    }
    modtm = {
      source  = "Azure/modtm"
      version = "~> 0.3.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
    # TODO: Ensure all required providers are listed here and the version property includes a constraint on the maximum major version.
  }
}
