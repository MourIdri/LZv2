resource "azurerm_route_table" "generic-udr" {
  name                     = "${var.source-subnet-id-output-name-module}"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  disable_bgp_route_propagation = true
  depends_on = [var.udr_depend_on_module]

  route {
    name           = "to-${var.target-subnet-LZ-Subnet1-name-for-default-udr}"
    address_prefix = "${var.target-subnet-LZ-Subnet1-range-for-default-udr}"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = "${var.fw-private-ip-id-output-module}"
  }
  route {
    name           = "to-${var.target-subnet-LZ-Subnet2-name-for-default-udr}"
    address_prefix = "${var.target-subnet-LZ-Subnet2-range-for-default-udr}"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = "${var.fw-private-ip-id-output-module}"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet_route_table_association" "generic-udr-association" {
  subnet_id      = "${var.source-subnet-id-output-module}" 
  route_table_id = azurerm_route_table.generic-udr.id
}