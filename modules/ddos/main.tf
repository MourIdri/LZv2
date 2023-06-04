resource "azurerm_network_ddos_protection_plan" "AzureDDOS" {
  name                = "${var.current-name-convention-core-public-module}-ddos"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  depends_on = [var.ddos_depend_on_module]
  tags      = "${var.tags-ddos-logging-module}"
}