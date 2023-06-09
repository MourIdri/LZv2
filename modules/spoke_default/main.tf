#BLOB storage to stor anylogs
resource "azurerm_resource_group" "RG-spoke-default" {
  name                     = "${var.current-name-convention-core-module}-spk-rg"
  location                 = "${var.preferred-location-module}"
  tags = "${var.tags-rg-default-spoke-module}"
  depends_on = [var.rg_default_spoke_depends_on]
}
#VNET AND Subnet for Spoke 
resource "azurerm_virtual_network" "vnet-spoke-vnet" {
    name                = "${var.name-vnet-spoke-module}"
    location            = "${var.preferred-location-module}"
    resource_group_name = "${var.current-name-convention-core-module}-spk-rg"
    address_space       = ["${var.ip-range-vnet-spoke-module}"]
    depends_on = [azurerm_resource_group.RG-spoke-default]       
    tags = "${var.tags-vnet-spoke-module}"
}
resource "azurerm_subnet" "default-spoke-subnet" {
  name                 = "${var.snet-name-spoke-subnet-module}"
  resource_group_name = "${var.current-name-convention-core-module}-spk-rg"
  virtual_network_name = "${var.name-vnet-spoke-module}"
  address_prefixes     = ["${var.ip-range-default-subnet-spoke-module}"]
  depends_on = [ azurerm_virtual_network.vnet-spoke-vnet]
}
resource "azurerm_network_security_group" "Mgmt-nsg" {
  name                = "${var.snet-name-spoke-subnet-module}-nsg"
  location            = "${var.preferred-location-module}"
  resource_group_name = "${var.current-name-convention-core-module}-spk-rg"
  depends_on = [ azurerm_subnet.default-spoke-subnet]
}

