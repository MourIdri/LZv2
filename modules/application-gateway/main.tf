resource "azurerm_public_ip" "appgw-pip" {
  name                = "pip-${var.current-name-convention-core-public-module}-AppGw"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  allocation_method   = "Static"
  sku                 = "Standard"
}
# APp GW via terraform requires the use of a backend setup even if this is not existing. So it has to be deleted prior to custom. 
locals {
  backend_address_pool_name      = "basic_beap"
  frontend_port_name             = "basic_feport"
  frontend_ip_configuration_name = "basic_feip"
  http_setting_name              = "basic_be-htst"
  listener_name                  = "basic_httplstn"
  request_routing_rule_name      = "basic_rqrt"
  redirect_configuration_name    = "basic_rdrcfg"
}
resource "azurerm_application_gateway" "AppGW" {
  name                = "${var.current-name-convention-core-public-module}AppGw"
  location                 = "${var.preferred-location-module}"
  resource_group_name      = "${var.module-resource-module-rg}"
  tags = "${var.tags-AppGW-module}"
  depends_on = [var.azappgw_depend_on_module]
  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }
  waf_configuration {
    enabled    = true
    firewall_mode = "Prevention"
    max_request_body_size_kb = 16
    rule_set_version  = 3.1
    rule_set_type = "OWASP"
  }
  gateway_ip_configuration {
    name                 = "IPconf${var.current-name-convention-core-public-module}-AppGw"
    subnet_id = "${var.appgw-subnet-id-output-module}"
  }
   frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgw-pip.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
    priority = 20
  }

}
