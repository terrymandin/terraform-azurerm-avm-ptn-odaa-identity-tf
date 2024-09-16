output "resource_id" {
  description = "value of the resource id."
  value = data.azurerm_subscription.primary.id
}