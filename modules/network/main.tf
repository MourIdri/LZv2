#VNET AND Subnet for Hub 
resource "azurerm_virtual_network" "hub-corpc-vnet" {
    name                = "${var.name-vnet-module}"
    location            = "${var.preferred-location-module}"
    resource_group_name = "${var.module-resource-module-rg}"
    address_space       = ["${var.ip-range-vnet-module}"]
    depends_on = [var.vnet_depend_on_module]
    ddos_protection_plan {
    id     = "${var.ddos-plan-id-output-module}"
    enable = true
    }       
    tags = "${var.tags-vnet-module}"
}
#Subnet layout and default NSG 
resource "azurerm_subnet" "GatewaySubnet" {
  name                 = "${var.snet-name-GatewaySubnet-module}"
  resource_group_name = "${var.module-resource-module-rg}"
  virtual_network_name = "${var.name-vnet-module}"
  address_prefixes     = ["${var.ip-range-GatewaySubnet-module}"]
  depends_on = [ azurerm_virtual_network.hub-corpc-vnet]
}
resource "azurerm_subnet" "AzureRouteServer" {
  name                 = "${var.snet-name-AzureRouteServer-module}"
  resource_group_name = "${var.module-resource-module-rg}"
  virtual_network_name = "${var.name-vnet-module}"
  address_prefixes     = ["${var.ip-range-AzureRouteServer-module}"]
  depends_on = [ azurerm_virtual_network.hub-corpc-vnet]
}
resource "azurerm_subnet" "AzureFirewall" {
  name                 = "${var.snet-name-AzureFirewall-module}"
  resource_group_name = "${var.module-resource-module-rg}"
  virtual_network_name = "${var.name-vnet-module}"
  address_prefixes     = ["${var.ip-range-AzureFirewall-module}"]
  depends_on = [ azurerm_virtual_network.hub-corpc-vnet]
}
resource "azurerm_subnet" "AzureBastion" {
  name                 = "${var.snet-name-AzureBastion-module}"
  resource_group_name = "${var.module-resource-module-rg}"
  virtual_network_name = "${var.name-vnet-module}"
  address_prefixes     = ["${var.ip-range-AzureBastion-module}"]
  depends_on = [ azurerm_virtual_network.hub-corpc-vnet]
}
resource "azurerm_subnet" "AzureAppGW" {
  name                 = "${var.snet-name-AzureAppGW-module}"
  resource_group_name = "${var.module-resource-module-rg}"
  virtual_network_name = "${var.name-vnet-module}"
  address_prefixes     = ["${var.ip-range-AzureAppGW-module}"]
  depends_on = [ azurerm_virtual_network.hub-corpc-vnet]
}
resource "azurerm_subnet" "Mgmt" {
  name                 = "${var.snet-name-Mgmt-module}"
  resource_group_name = "${var.module-resource-module-rg}"
  virtual_network_name = "${var.name-vnet-module}"
  address_prefixes     = ["${var.ip-range-Mgmt-module}"]
  depends_on = [ azurerm_virtual_network.hub-corpc-vnet]
}
resource "azurerm_network_security_group" "Mgmt-nsg" {
  name                = "${var.snet-name-Mgmt-module}-nsg"
  location            = "${var.preferred-location-module}"
  resource_group_name = "${var.module-resource-module-rg}"
  depends_on = [ azurerm_subnet.Mgmt]
}
resource "azurerm_subnet_network_security_group_association" "Mgmt-nsg" {
  subnet_id                 = azurerm_subnet.Mgmt.id
  network_security_group_id = azurerm_network_security_group.Mgmt-nsg.id
  depends_on = [ azurerm_subnet.Mgmt,azurerm_network_security_group.Mgmt-nsg]
}
resource "azurerm_subnet" "SharedServices" {
  name                 = "${var.snet-name-SharedServices-module}"
  resource_group_name = "${var.module-resource-module-rg}"
  virtual_network_name = "${var.name-vnet-module}"
  address_prefixes     = ["${var.ip-range-SharedServices-module}"]
  depends_on = [ azurerm_virtual_network.hub-corpc-vnet]
}
resource "azurerm_network_security_group" "SharedServices-nsg" {
  name                = "${var.snet-name-SharedServices-module}-nsg"
  location            = "${var.preferred-location-module}"
  resource_group_name = "${var.module-resource-module-rg}"
  depends_on = [ azurerm_subnet.SharedServices]
}
resource "azurerm_subnet_network_security_group_association" "SharedServices-nsg" {
  subnet_id                 = azurerm_subnet.SharedServices.id
  network_security_group_id = azurerm_network_security_group.SharedServices-nsg.id
  depends_on = [ azurerm_subnet.SharedServices,azurerm_network_security_group.SharedServices-nsg]
}

