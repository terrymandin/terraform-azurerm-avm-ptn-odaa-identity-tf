locals {
  group_to_role_mapping = tomap({
    (local.odbaa_adbs_db_administrator_group)    = var.adbs_rbac ? one(azurerm_role_definition.odbaa_adbs_db_administrators_role).name : ""
    (local.odbaa_exa_infra_administrator_group)  = "Oracle.Database Exadata Infrastructure Administrator Built-in Role"
    (local.odbaa_vm_cluster_administrator_group) = "Oracle.Database VmCluster Administrator Built-in Role"
    (local.odbaa_db_family_administrators_group) = "Oracle.Database Owner Built-in Role"
    (local.odbaa_db_family_readers_group)        = "Oracle.Database Reader Built-in Role"
  })
  odbaa_adbs_db_administrator_group    = format("%sodbaa-adbs-db-administrators-group", var.group_prefix)
  odbaa_costmgmt_administrators_group  = format("%sodbaa-costmgmt-administrators", var.group_prefix)
  odbaa_db_family_administrators_group = format("%sodbaa-db-family-administrators", var.group_prefix)
  odbaa_db_family_readers_group        = format("%sodbaa-db-family-readers", var.group_prefix)
  odbaa_exa_cdb_administrators_group   = format("%sodbaa-exa-cdb-administrators", var.group_prefix)
  odbaa_exa_infra_administrator_group  = format("%sodbaa-exa-infra-administrator", var.group_prefix)
  odbaa_exa_pdb_administrators_group   = format("%sodbaa-exa-pdb-administrators", var.group_prefix)
  odbaa_network_administrators_group   = format("%sodbaa-network-administrators", var.group_prefix)
  # odbaa_other_group includes groups doesn't need build in Azure role assigned.
  odbaa_other_groups                   = toset(compact([local.odbaa_costmgmt_administrators_group, local.odbaa_network_administrators_group, local.odbaa_exa_cdb_administrators_group, local.odbaa_exa_pdb_administrators_group]))
  odbaa_vm_cluster_administrator_group = format("%sodbaa-vm-cluster-administrator", var.group_prefix)
}

data "azurerm_subscription" "primary" {}

resource "azurerm_role_definition" "odbaa_adbs_db_administrators_role" {
  count = var.adbs_rbac ? 1 : 0

  name  = "Oracle.Database Autonomous Database Administrator"
  scope = data.azurerm_subscription.primary.id
  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
  description = "Grants full access to manage all ADB-S resources"

  permissions {
    actions = [
      "Oracle.Database/autonomousDatabases/*/read",
      "Oracle.Database/autonomousDatabases/*/write",
      "Oracle.Database/autonomousDatabases/*/delete",
      "Oracle.Database/Locations/*/read",
      "Oracle.Database/Locations/*/write",
      "Oracle.Database/Operations/read",
      "Oracle.Database/oracleSubscriptions/*/read",
      "Oracle.Database/oracleSubscriptions/*/action",
      "Microsoft.Network/virtualNetworks/read",
      "Microsoft.Network/virtualNetworks/subnets/read",
      "Microsoft.Network/virtualNetworks/subnets/write",
      "Microsoft.Network/locations/*/read",
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Resources/deployments/*"
    ]
    data_actions     = []
    not_actions      = []
    not_data_actions = []
  }
}

terraform {
  required_version = "~> 1.5"
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "~> 2.48.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

data "azurerm_subscription" "primary" {
}

resource "azurerm_role_assignment" "rbac_role_assignment" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = local.group_to_role_mapping[each.value.display_name]
  principal_id         = each.value.object_id
  for_each             = azuread_group.odbaa-required-azure-role-assignment-group
}

resource "azuread_group" "odbaa_other_group" {
  display_name     = each.key
  security_enabled = true
  for_each         = local.odbaa_other_groups
}