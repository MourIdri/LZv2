resource "azurerm_public_ip" "bastion-pip" {
  name                = "pip-${var.current-name-convention-core-public-module}-bastion"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion-svc" {
  name                = "${var.current-name-convention-core-public-module}-bastion"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  depends_on = [var.azbastion_depend_on_module]
  ip_configuration {
    name                 = "IPconf${var.current-name-convention-core-public-module}-bastion"
    subnet_id            = "${var.bastion-subnet-id-output-module}"
    public_ip_address_id = azurerm_public_ip.bastion-pip.id
  }
  tags = "${var.tags-bastion-module}"
}
