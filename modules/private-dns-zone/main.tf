resource "azurerm_private_dns_zone" "hub-private-dns-zone" {
  name                = "${var.module-domain-private-dns-domain-for-vnet-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  depends_on = [var.pdnsz_depend_on_module]
  tags      = "${var.tags-pdnsz-logging-module}"  
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                = "nt-link-${var.current-name-convention-core-public-module}-pri-dns-zone"
  resource_group_name      = "${var.module-resource-module-rg}"
  private_dns_zone_name = azurerm_private_dns_zone.hub-private-dns-zone.name
  virtual_network_id    = "${var.hub-vnet-id-output-module}"
}