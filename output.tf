# Subscription 1 AJN-Hub output 
data "azurerm_client_config" "AJN-Hub" {
  provider            = azurerm.AJN-Hub
}
output "subscription_id-AJN-Hub" {
  value = data.azurerm_client_config.AJN-Hub.subscription_id
}
output "client_id-AJN-Hub" {
  value = data.azurerm_client_config.AJN-Hub.client_id
}
output "tenant_id-AJN-Hub" {
  value = data.azurerm_client_config.AJN-Hub.tenant_id
}
output "object_id-AJN-Hub" {
  value = data.azurerm_client_config.AJN-Hub.object_id
}
# Subscription 2 AJN-Management Output  
data "azurerm_client_config" "AJN-Management" {
  provider            = azurerm.AJN-Management
}
output "subscription_id-AJN-Management" {
  value = data.azurerm_client_config.AJN-Management.subscription_id
}
output "client_id-AJN-Management" {
  value = data.azurerm_client_config.AJN-Management.client_id
}
output "tenant_id-AJN-Management" {
  value = data.azurerm_client_config.AJN-Management.tenant_id
}
output "object_id-AJN-Management" {
  value = data.azurerm_client_config.AJN-Management.object_id
}
# Subscription 3 AJN-Backup Output  
data "azurerm_client_config" "AJN-Backup" {
  provider            = azurerm.AJN-Backup
}
output "subscription_id-AJN-Backup" {
  value = data.azurerm_client_config.AJN-Backup.subscription_id
}
output "client_id-AJN-Backup" {
  value = data.azurerm_client_config.AJN-Backup.client_id
}
output "tenant_id-AJN-Backup" {
  value = data.azurerm_client_config.AJN-Backup.tenant_id
}
output "object_id-AJN-Backup" {
  value = data.azurerm_client_config.AJN-Backup.object_id
}
