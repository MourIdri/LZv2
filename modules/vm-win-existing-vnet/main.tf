resource "azurerm_network_interface" "Default-NIC" {
  name                     = "NIC-${var.current-name-convention-core-public-module}-jmbx-01"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  depends_on = [var.jmbx_depend_on_module]   
  ip_configuration {
    name                          = "IPconf${var.current-name-convention-core-public-module}-WIN-VM-default"
    subnet_id                     = "${var.mgmt-subnet-id-output-module}"
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_windows_virtual_machine" "Default-WIN-VM" {
  name                     = "${var.current-name-convention-core-public-module}jmbx01"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  depends_on = [var.jmbx_depend_on_module]  
  tags = "${var.tags-jmbx-logging-module}"   
  size                = "${var.module-vm-jmbx-size-module}"
  admin_username      = "${var.module-vm-jmbx-user-module}"
  admin_password      = "${var.module-vm-jmbx-password-module}"
  network_interface_ids = [ 
    azurerm_network_interface.Default-NIC.id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
