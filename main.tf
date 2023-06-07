
provider "azurerm" {
  version="3.59.0"
  features {}
  subscription_id = "${var.azure-subscription-id}"
  client_id       = "${var.azure-client-app-id}"
  client_secret   = "${var.azure-client-secret-password}"
   tenant_id       = "${var.azure-tenant-id}"
}
module "management-groups" {
  source               = "./modules/management-groups"
}
module "network-rg" {
  source               = "./modules/rg"
  current-name-convention-core-module  = "network-${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  tags-rg-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="network"
    type_2="security"
   }
}
module "AzureDDOS" {
  source               = "./modules/ddos"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "security-${var.current-name-convention-core-main}-rg"
  tags-ddos-logging-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="network"
    type_2="security"
   }
  ddos_depend_on_module = [module.security-rg]
}
module "hub-network" {
  source               = "./modules/network"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "network-${var.current-name-convention-core-main}-rg"
  tags-vnet-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="network_Azure_is_better"
    type_2="security"
   }
  ip-range-vnet-module = "${var.current-vnet-space}"
  name-vnet-module = "${var.current-vnet-name}"
  ip-range-GatewaySubnet-module = "${var.current-GatewaySubnet-space}"
  snet-name-GatewaySubnet-module = "${var.current-GatewaySubnet-subnet-name}"
  ip-range-AzureRouteServer-module = "${var.current-AzureRouteServer-space}"
  snet-name-AzureRouteServer-module = "${var.current-AzureRouteServer-subnet-name}"
  ip-range-AzureFirewall-module = "${var.current-AzureFirewall-space}"
  snet-name-AzureFirewall-module = "${var.current-AzureFirewall-subnet-name}"
  ip-range-AzureBastion-module = "${var.current-AzureBastion-space}"
  snet-name-AzureBastion-module = "${var.current-AzureBastion-subnet-name}"
  ip-range-AzureAppGW-module = "${var.current-AzureAppGW-space}"
  snet-name-AzureAppGW-module = "${var.current-AzureAppGW-subnet-name}"
  ip-range-Mgmt-module = "${var.current-Mgmt-space}"
  snet-name-Mgmt-module = "${var.current-Mgmt-subnet-name}"
  ip-range-SharedServices-module = "${var.current-SharedServices-space}"
  snet-name-SharedServices-module = "${var.current-SharedServices-subnet-name}"
  vnet_depend_on_module = [module.network-rg,module.AzureDDOS]
  ddos-plan-id-output-module = "${module.AzureDDOS.DDOS_plan_id}"
}
module "Azure-Private-DNS-Hub" {
  source               = "./modules/private-dns-zone"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "network-${var.current-name-convention-core-main}-rg"
  hub-vnet-id-output-module = "${module.hub-network.Azure_HUB_vnet_id}"
  module-domain-private-dns-domain-for-vnet-module =  "${var.domain-private-dns-domain-for-vnet-main}"
  tags-pdnsz-logging-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="network_security"
    type_2="system"}
  pdnsz_depend_on_module = [module.hub-network]
}
module "Azurefirewall" {
  source               = "./modules/firewall"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "network-${var.current-name-convention-core-main}-rg"
  tags-fw-logging-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="network"
    type_2="security"
   }
  frw_depend_on_module = [module.hub-network]
  fw-subnet-id-output-module = "${module.hub-network.Azure_firewall_subnet_id}"
  ip-range-vnet-module = "${var.current-vnet-space}"
}
module "Generic-UDR-GateWaySubnet" {
  source               = "./modules/generic-udr"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "network-${var.current-name-convention-core-main}-rg"
  udr_depend_on_module = [module.Azurefirewall]
  fw-private-ip-id-output-module = "${module.Azurefirewall.firewall_private_ip}"
  source-subnet-id-output-module = "${module.hub-network.Azure_Gateway_subnet_id}"
  source-subnet-id-output-name-module = "udr-Snet-GateWaySubnet"
  target-subnet-LZ-Subnet1-range-for-default-udr = "${var.current-Mgmt-space}"
  target-subnet-LZ-Subnet1-name-for-default-udr = "to-LZ-Mgmt"
  target-subnet-LZ-Subnet2-range-for-default-udr = "${var.current-SharedServices-space}"
  target-subnet-LZ-Subnet2-name-for-default-udr = "to-LZ-SharedServices"
}
module "Generic-UDR-Mgmt" {
  source               = "./modules/generic-udr"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "network-${var.current-name-convention-core-main}-rg"
  udr_depend_on_module = [module.Azurefirewall]
  fw-private-ip-id-output-module = "${module.Azurefirewall.firewall_private_ip}"
  source-subnet-id-output-module = "${module.hub-network.Azure_Mgmt_subnet_id}"
  source-subnet-id-output-name-module = "udr-Snet-Mgmt"
  target-subnet-LZ-Subnet1-range-for-default-udr = "${var.current-GatewaySubnet-space}"
  target-subnet-LZ-Subnet1-name-for-default-udr = "to-LZ-Gateway"
  target-subnet-LZ-Subnet2-range-for-default-udr = "${var.current-SharedServices-space}"
  target-subnet-LZ-Subnet2-name-for-default-udr = "to-LZ-SharedServices"
}
module "Generic-UDR-SharedServices" {
  source               = "./modules/generic-udr"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "network-${var.current-name-convention-core-main}-rg"
  udr_depend_on_module = [module.Azurefirewall]
  fw-private-ip-id-output-module = "${module.Azurefirewall.firewall_private_ip}"
  source-subnet-id-output-module = "${module.hub-network.Azure_SharedServices_subnet_id}"
  source-subnet-id-output-name-module = "udr-Snet-SharedServices"
  target-subnet-LZ-Subnet1-range-for-default-udr = "${var.current-GatewaySubnet-space}"
  target-subnet-LZ-Subnet1-name-for-default-udr = "to-LZ-Gateway"
  target-subnet-LZ-Subnet2-range-for-default-udr = "${var.current-Mgmt-space}"
  target-subnet-LZ-Subnet2-name-for-default-udr = "to-LZ-Mgmt"
}
module "monitoring-rg" {
  source               = "./modules/rg"
  current-name-convention-core-module  = "monitoring-${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  tags-rg-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="system"
    type_2="monitoring"
   }
}
module "logging" {
  source               = "./modules/logging"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "monitoring-${var.current-name-convention-core-main}-rg"
  devops_project_object_id = "${var.azure-client-app-id}"
  tags-sto-logging-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="system"
    type_2="monitoring"
   }
  stoc_depend_on_module = [module.monitoring-rg ]
  tags-repo-logging-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="system"
    type_2="monitoring"
   }
  logacc_depend_on_module = [module.monitoring-rg]
}
module "security-rg" {
  source               = "./modules/rg"
  current-name-convention-core-module  = "security-${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  tags-rg-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="system"
    type_2="security"
   }
}
module "akv-lz" {
  source               = "./modules/akv"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "security-${var.current-name-convention-core-main}-rg"
  tags-akv-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="network"
    type_2="security"
   }
  akv_depend_on_module = [module.security-rg]
}
module "Azure-bastion" {
  source               = "./modules/bastion"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "security-${var.current-name-convention-core-main}-rg"
  bastion-subnet-id-output-module = "${module.hub-network.Azure_Bastion_subnet_id}"
  tags-bastion-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="network"
    type_2="security"
   }
  azbastion_depend_on_module = [module.security-rg]
}
module "Azure-AppGW" {
  source               = "./modules/application-gateway"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "security-${var.current-name-convention-core-main}-rg"
  appgw-subnet-id-output-module = "${module.hub-network.Azure_AppGW_subnet_id}"
  tags-AppGW-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="network"
    type_2="security"
   }
  azappgw_depend_on_module = [module.security-rg]
}
module "mgmt-rg" {
  source               = "./modules/rg"
  current-name-convention-core-module  = "mgmt-${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  tags-rg-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="management"
    type_2="shared-services"
   }
}
module "backup-rg" {
  source               = "./modules/rg"
  current-name-convention-core-module  = "backup-${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  tags-rg-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="system"
    type_2="bcdr"
   }
}
module "Azure-BCDR" {
  source               = "./modules/backup"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "backup-${var.current-name-convention-core-main}-rg"
  tags-BCDR-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="system"
    type_2="bcdr"
   }
  azbcdr_depend_on_module = [module.backup-rg]
}
module "vpn-onprem" {
  
  source               = "./modules/vpn-onprem-cloud"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "network-${var.current-name-convention-core-main}-rg"
  tags-vpn-standard-connect-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="network"
    type_2="security"
    }
  tags-onprem-1-standard-connect-module =  {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="network"
    type_2="security"
    }
  vpn_gw_depend_on = [module.hub-network]
  subnet-vpn-target-id-module = "${module.hub-network.Azure_Gateway_subnet_id}"
  iprange-onprem-module = "${var.VPN-Session-IPRange-onprem-local-router}"
  ipaddress-routeur-onprem-1-module = "${var.publicIP-onprem-local-router}"
  s2s-connection-pass = "${var.s2ssharedPassconnectionKey}"
  }
