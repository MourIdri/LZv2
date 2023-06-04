output "Azure_firewall_subnet_id" {
  value = azurerm_subnet.AzureFirewall.id
}
output "Azure_Gateway_subnet_id" {
  value = azurerm_subnet.GatewaySubnet.id
}
output "Azure_Mgmt_subnet_id" {
  value = azurerm_subnet.Mgmt.id
}
output "Azure_SharedServices_subnet_id" {
  value = azurerm_subnet.SharedServices.id
}
output "Azure_Bastion_subnet_id" {
  value = azurerm_subnet.AzureBastion.id
}
output "Azure_AppGW_subnet_id" {
  value = azurerm_subnet.AzureAppGW.id
}