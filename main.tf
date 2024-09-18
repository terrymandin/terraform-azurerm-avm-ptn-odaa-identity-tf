module "azure_identity" {
  source = "./modules/azure-identity"
  adbs_rbac = var.adbs_rbac
  group_prefix = var.group_prefix
}

data "azurerm_subscription" "primary" {}