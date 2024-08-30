<!-- BEGIN_TF_DOCS -->
# terraform-azurerm-avm-template

This is a template repo for Terraform Azure Verified Modules.

Things to do:

1. Set up a GitHub repo environment called `test`.
1. Configure environment protection rule to ensure that approval is required before deploying to this environment.
1. Create a user-assigned managed identity in your test subscription.
1. Create a role assignment for the managed identity on your test subscription, use the minimum required role.
1. Configure federated identity credentials on the user assigned managed identity. Use the GitHub environment.
1. Search and update TODOs within the code and remove the TODO comments once complete.

> [!IMPORTANT]
> As the overall AVM framework is not GA (generally available) yet - the CI framework and test automation is not fully functional and implemented across all supported languages yet - breaking changes are expected, and additional customer feedback is yet to be gathered and incorporated. Hence, modules **MUST NOT** be published at version `1.0.0` or higher at this time.
>
> All module **MUST** be published as a pre-release version (e.g., `0.1.0`, `0.1.1`, `0.2.0`, etc.) until the AVM framework becomes GA.
>
> However, it is important to note that this **DOES NOT** mean that the modules cannot be consumed and utilized. They **CAN** be leveraged in all types of environments (dev, test, prod etc.). Consumers can treat them just like any other IaC module and raise issues or feature requests against them as they learn from the usage of the module. Consumers should also read the release notes for each version, if considering updating to a more recent version of a module to see if there are any considerations or breaking changes etc.

<!-- markdownlint-disable MD033 -->
## Requirements

No requirements.

## Resources

The following resources are used by this module:

- [azurerm_role_definition.odbaa_adbs_db_administrators_role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) (resource)
- [azurerm_subscription.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_adbs_rbac"></a> [adbs\_rbac](#input\_adbs\_rbac)

Description: Setup RBAC for ADB-S in Azure. Default is false.

Type: `bool`

Default: `false`

### <a name="input_exa_rbac"></a> [exa\_rbac](#input\_exa\_rbac)

Description: Setup RBAC for Exa in Azure. Default is false.

Type: `bool`

Default: `false`

### <a name="input_group_prefix"></a> [group\_prefix](#input\_group\_prefix)

Description: Group name prefix in Azure

Type: `string`

Default: `""`

## Outputs

No outputs.

## Modules

The following Modules are called:

### <a name="module_azure_rbac_setup"></a> [azure\_rbac\_setup](#module\_azure\_rbac\_setup)

Source: ./azure-rbac

Version:

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->