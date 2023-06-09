provider "azurerm" {
  version="3.59.0"
  features {}
  subscription_id = "${var.azure-default-subscription-id}"
  client_id       = "${var.azure-default-client-app-id}"
  client_secret   = "${var.azure-default-client-secret-password}"
  tenant_id       = "${var.azure-default-tenant-id}"  
}
provider "azurerm" {
  version="3.59.0"
  alias = "AJN-Hub"
  features {}
  subscription_id = "${var.azure-AJN-Hub-subscription-id}"
  client_id       = "${var.azure-AJN-Hub-client-app-id}"
  client_secret   = "${var.azure-AJN-Hub-client-secret-password}"
  tenant_id       = "${var.azure-AJN-Hub-tenant-id}"
}
provider "azurerm" {
  version="3.59.0"  
  alias = "AJN-Management"
  features {}
  subscription_id = "${var.azure-AJN-Management-subscription-id}"
  client_id       = "${var.azure-AJN-Management-client-app-id}"
  client_secret   = "${var.azure-AJN-Management-client-secret-password}"
  tenant_id       = "${var.azure-AJN-Management-tenant-id}"
}
provider "azurerm" {
  version="3.59.0"  
  alias = "AJN-Backup"
  features {}
  subscription_id = "${var.azure-AJN-Backup-subscription-id}"
  client_id       = "${var.azure-AJN-Backup-client-app-id}"
  client_secret   = "${var.azure-AJN-Backup-client-secret-password}"
  tenant_id       = "${var.azure-AJN-Backup-tenant-id}"
}



#module "management-groups" {
#  source               = "./modules/management-groups"
#}
module "network-rg" {
  source               = "./modules/rg"
  current-name-convention-core-module  = "network-${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}
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
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}  
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
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}  
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
  ip-range-AzureAppGW-module = "${var.current-AzureAppGW-space}"
  snet-name-AzureAppGW-module = "${var.current-AzureAppGW-subnet-name}"
  ip-range-SharedServices-module = "${var.current-SharedServices-space}"
  snet-name-SharedServices-module = "${var.current-SharedServices-subnet-name}"
  vnet_depend_on_module = [module.network-rg,module.AzureDDOS]
  ddos-plan-id-output-module = "${module.AzureDDOS.DDOS_plan_id}"
}
module "Azure-Private-DNS-Hub" {
  source               = "./modules/private-dns-zone"
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}    
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
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}  
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
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}    
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "network-${var.current-name-convention-core-main}-rg"
  udr_depend_on_module = [module.Azurefirewall]
  fw-private-ip-id-output-module = "${module.Azurefirewall.firewall_private_ip}"
  source-subnet-id-output-module = "${module.hub-network.Azure_Gateway_subnet_id}"
  source-subnet-id-output-name-module = "udr-Snet-GateWaySubnet"
  target-subnet-LZ-Subnet1-range-for-default-udr = "${var.current-spoke-subnet-1-space}"
  target-subnet-LZ-Subnet1-name-for-default-udr = "to-spoke-Mgmt"
  target-subnet-LZ-Subnet2-range-for-default-udr = "${var.current-SharedServices-space}"
  target-subnet-LZ-Subnet2-name-for-default-udr = "to-LZ-SharedServices"
}

module "Generic-UDR-SharedServices" {
  source               = "./modules/generic-udr"
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}    
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
  target-subnet-LZ-Subnet2-range-for-default-udr = "${var.current-spoke-subnet-1-space}"
  target-subnet-LZ-Subnet2-name-for-default-udr = "to-spoke-Mgmt"
}
module "monitoring-rg" {
  source               = "./modules/rg"
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}  
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
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}    
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "monitoring-${var.current-name-convention-core-main}-rg"
  # devops_project_object_id = "${var.azure-client-app-id}"
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
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}    
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
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}    
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


module "Azure-AppGW" {
  source               = "./modules/application-gateway"
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}    
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
module "backup-rg" {
  source               = "./modules/rg"
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Backup}    
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
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Backup}    
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
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Hub}    
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

######################################################################################################################################
######################################################################################################################################
###########################################          ADDING A NEW SPOKE         ######################################################
######################################################################################################################################
######################################################################################################################################

module "mgmt-spoke" {
  source               = "./modules/spoke_default"
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Management}    
  current-name-convention-core-module  = "mgmt-${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  rg_default_spoke_depends_on =  [module.security-rg]
  name-vnet-spoke-module = "${var.current-vnet-spoke-name}"
  ip-range-AzureBastion-module = "${var.current-AzureBastion-space}"
  snet-name-AzureBastion-module = "${var.current-AzureBastion-subnet-name}"
  ip-range-vnet-spoke-module = "${var.current-vnet-spoke-space}"
  ip-range-default-subnet-spoke-module = "${var.current-spoke-subnet-1-space}"
  snet-name-spoke-subnet-module = "${var.current-spoke-subnet-1-name}"
  tags-rg-default-spoke-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="management"
    type_2="shared-services"
   }
  tags-vnet-spoke-module =  {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="management"
    type_2="shared-services"
   }
}
module "Azure-bastion" {
  source               = "./modules/bastion"
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Management}    
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "mgmt-${var.current-name-convention-core-main}-spk-rg"
  bastion-subnet-id-output-module = "${module.mgmt-spoke.Azure_Bastion_subnet_id}"
  tags-bastion-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="network"
    type_2="security"
   }
  azbastion_depend_on_module = [module.mgmt-spoke]
}
module "Generic-UDR-Mgmt" {
  source               = "./modules/generic-udr"
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Management}  
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  current-name-convention-core-module  = "${var.current-name-convention-core-main}"
  preferred-location-module = "${var.preferred-location-main}"
  module-resource-module-rg = "mgmt-${var.current-name-convention-core-main}-spk-rg"
  udr_depend_on_module = [module.mgmt-spoke]
  fw-private-ip-id-output-module = "${module.Azurefirewall.firewall_private_ip}"
  source-subnet-id-output-module = "${module.mgmt-spoke.Azure_default_subnet_id}"
  source-subnet-id-output-name-module = "udr-Snet-Mgmt"
  target-subnet-LZ-Subnet1-range-for-default-udr = "${var.current-GatewaySubnet-space}"
  target-subnet-LZ-Subnet1-name-for-default-udr = "to-LZ-Gateway"
  target-subnet-LZ-Subnet2-range-for-default-udr = "${var.current-SharedServices-space}"
  target-subnet-LZ-Subnet2-name-for-default-udr = "to-LZ-SharedServices"
}
module "default-jumpboxes" {
  source               = "./modules/vm-win-existing-vnet"
  # Passing into a module the subscription where the module will be deployed  
  providers = {azurerm = azurerm.AJN-Management}    
  current-name-convention-core-module  = "mgmt-${var.current-name-convention-core-main}"
  current-name-convention-core-public-module = "${var.current-name-convention-core-public-main}"
  preferred-location-module = "${var.preferred-location-main}"
  mgmt-subnet-id-output-module = "${module.mgmt-spoke.Azure_default_subnet_id}"
  jmbx_depend_on_module = [module.mgmt-spoke]
  module-resource-module-rg = "mgmt-${var.current-name-convention-core-main}-spk-rg"
  module-vm-jmbx-size-module = "${var.vm-jmbx-1-size-current}"
  module-vm-jmbx-password-module = "${var.vm-jmbx-1-password-current}"
  module-vm-jmbx-user-module = "${var.vm-jmbx-1-user-current}"
  tags-jmbx-logging-module = {
    environment = "production"
    scope_1="shared_infrastructure"
    scope_2="core_infrastructure"
    type_1="management"
    type_2="shared-services"
   }
}

