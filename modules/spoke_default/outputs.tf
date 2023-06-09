output "Azure_deffault_vnet_id" {
  value = azurerm_virtual_network.vnet-spoke-vnet.id
}
output "Azure_default_subnet_id" {
  value = azurerm_subnet.default-spoke-subnet.id
}
