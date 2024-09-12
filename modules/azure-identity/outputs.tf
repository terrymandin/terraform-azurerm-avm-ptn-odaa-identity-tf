data "azurerm_subscription" "current" {}
 
output "resource_id" {
  value = data.azurerm_subscription.current.id
}