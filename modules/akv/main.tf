resource "azurerm_firewall_policy" "Default-Az-Fw-Policy" {
  name                = "policy-default-${var.current-name-convention-core-public-module}-fw"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  sku = "Standard"
}
resource "azurerm_public_ip" "azfw-pip-firewall" {
  name                = "pip-${var.current-name-convention-core-public-module}-fw"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on = [var.frw_depend_on_module]
  
}
resource "azurerm_firewall" "azfwmain" {
  name                = "${var.current-name-convention-core-public-module}-fw"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  tags = "${var.tags-fw-logging-module}"
  firewall_policy_id = azurerm_firewall_policy.Default-Az-Fw-Policy.id
  ip_configuration {
    name                 = "IPconf${var.current-name-convention-core-public-module}-fw"
    subnet_id            = "${var.fw-subnet-id-output-module}"
    public_ip_address_id = azurerm_public_ip.azfw-pip-firewall.id
  }
}


resource "azurerm_firewall_policy_rule_collection_group" "Default-Az-Fw-Policy-rl-cl-gp" {
  name                = "policy-default-rl-cl-gp-${var.current-name-convention-core-public-module}-fw"
  firewall_policy_id = azurerm_firewall_policy.Default-Az-Fw-Policy.id
  priority           = 500
  application_rule_collection {
    name     = "defaul-app-rl-cl-01"
    priority = 600
    action   = "Allow"
    rule {
      name = "from-LZ-to-PubliC-sites"
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      source_addresses  = ["${var.ip-range-vnet-module}"]
      destination_fqdns = ["*.microsoft.com","*.google.com","*.bing.com"]
    }
    rule {
      protocols {
        type = "Https"
        port = 443
      }
      name = "from-LZ-to-Azure-backplane-Services"
      source_addresses  = ["${var.ip-range-vnet-module}"]
      destination_fqdn_tags = ["WindowsUpdate","AzureBackup","WindowsVirtualDesktop","WindowsDiagnostics","MicrosoftActiveProtectionService"]
    }
  }

  network_rule_collection {
    name     = "defaul-ntw-rl-cl-01"
    priority = 400
    action   = "Allow"
    rule {
      name                  = "from-LZ-to-PubliC-DNS"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["${var.ip-range-vnet-module}"]
      destination_addresses = ["168.63.129.16", "8.8.8.8"]
      destination_ports     = ["53"]
    }
    rule {
      name                  = "from-LZ-to-PubliC-AzureAD"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["${var.ip-range-vnet-module}"]
      destination_addresses = ["AzureActiveDirectory"]
      destination_ports     = ["25"]
    }    
  }
}


