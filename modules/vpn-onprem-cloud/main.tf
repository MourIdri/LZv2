#VPNConfig
#Create Local Network Gateway
resource "azurerm_local_network_gateway" "onprem-corph-vpn-gw" {
  depends_on = [var.vpn_gw_depend_on]
  name                = "local-${var.current-name-convention-core-module}-gw"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  gateway_address     = "${var.ipaddress-routeur-onprem-1-module}"
  address_space       = ["${var.iprange-onprem-module}"]
  tags = "${var.tags-onprem-1-standard-connect-module}"
   }
# Virtual Network Gateway
resource "azurerm_public_ip" "vpn-gw-pip" {
  depends_on = [var.vpn_gw_depend_on]
  name                = "pip-${var.current-name-convention-core-module}-vpn-gw"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  domain_name_label            = "${var.current-name-convention-core-public-module}vpn1"
  allocation_method = "Dynamic"
  tags = "${var.tags-vpn-standard-connect-module}"
}
resource "azurerm_virtual_network_gateway" "vpn-gw" {
  depends_on = [azurerm_public_ip.vpn-gw-pip]
  name                = "${var.current-name-convention-core-module}-vpn-gw"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  type     = "Vpn"
  vpn_type = "RouteBased"
  active_active = false
  enable_bgp    = false
  generation = "Generation2"
  sku        = "VpnGw2"
  ip_configuration {
    name                = "IPconfig${var.current-name-convention-core-module}-vpn-gw"
    public_ip_address_id          = azurerm_public_ip.vpn-gw-pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "${var.subnet-vpn-target-id-module}"
  }
  tags = "${var.tags-vpn-standard-connect-module}"
}
# Virtual CREAT CONENCTION
resource "azurerm_virtual_network_gateway_connection" "vpn-gw-conx-1" {
  name                = "conx-${var.current-name-convention-core-module}-vpn-01" 
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  type           = "IPsec"
  routing_weight = 1
  virtual_network_gateway_id      = azurerm_virtual_network_gateway.vpn-gw.id
  local_network_gateway_id = azurerm_local_network_gateway.onprem-corph-vpn-gw.id
  shared_key = "${var.s2s-connection-pass}"
  depends_on = [azurerm_virtual_network_gateway.vpn-gw,azurerm_local_network_gateway.onprem-corph-vpn-gw]
}
