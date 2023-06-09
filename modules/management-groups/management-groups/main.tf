resource "azurerm_management_group" "layer-00-mgmgt-grp-01" {
  display_name = "Aljazeera.net"
}

resource "azurerm_management_group" "layer-01-mgmgt-grp-01" {
  display_name               = "Legacy"
  parent_management_group_id = azurerm_management_group.layer-00-mgmgt-grp-01.id
}
resource "azurerm_management_group" "layer-01-mgmgt-grp-02" {
  display_name               = "TNO"
  parent_management_group_id = azurerm_management_group.layer-00-mgmgt-grp-01.id
}
resource "azurerm_management_group" "layer-01-mgmgt-grp-03" {
  display_name               = "Digital"
  parent_management_group_id = azurerm_management_group.layer-00-mgmgt-grp-01.id
}
resource "azurerm_management_group" "layer-01-mgmgt-grp-04" {
  display_name               = "Infrastructure"
  parent_management_group_id = azurerm_management_group.layer-00-mgmgt-grp-01.id
}
resource "azurerm_management_group" "layer-01-mgmgt-grp-05" {
  display_name               = "Security"
  parent_management_group_id = azurerm_management_group.layer-00-mgmgt-grp-01.id
}
