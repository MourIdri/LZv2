############################
# Authentication variables #
############################
# Add you service endpoint access strings
# Subscription default 
azure-default-client-app-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-default-subscription-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-default-client-secret-password = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-default-tenant-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
# Subscription Hub
azure-AJN-Hub-client-app-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-AJN-Hub-subscription-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-AJN-Hub-client-secret-password = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-AJN-Hub-tenant-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
# Subscription management 
azure-AJN-Management-client-app-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-AJN-Management-subscription-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-AJN-Management-client-secret-password = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-AJN-Management-tenant-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
# Subscription Backup
azure-AJN-Backup-client-app-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-AJN-Backup-subscription-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-AJN-Backup-client-secret-password = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-AJN-Backup-tenant-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

###############################
# GENERAL  Naming VARIABLES   #
###############################
preferred-location-main = "westeurope"
second-location-main = "northeurope"
#####PLEAS CHANGE THE BELOW 2VALUEs TO REFLECT YOU KEY Naming 
current-name-convention-core-main = "ajnai"
current-name-convention-core-public-main = "ajnai"
############################
# GENERAL NETWRK VARIABLES #
############################
current-vnet-space = "172.16.0.0/22"
current-vnet-name  = "VNet-AJN-Hub"
current-GatewaySubnet-space = "172.16.0.0/27"
current-GatewaySubnet-subnet-name = "GatewaySubnet"
current-AzureRouteServer-space = "172.16.0.32/27"
current-AzureRouteServer-subnet-name = "Snet-AzRouter"
current-SharedServices-space = "172.16.0.64/27"
current-SharedServices-subnet-name = "Snet-SS"
current-AzureAppGW-space = "172.16.0.128/25"
current-AzureAppGW-subnet-name = "Snet-AppGW"
current-AzureFirewall-space = "172.16.2.0/25"
current-AzureFirewall-subnet-name = "AzureFirewallSubnet"
domain-private-dns-domain-for-vnet-main  = "ajn.net"
############################
# GENERAL VPN S2S VARIABLE #
############################
VPN-Session-IPRange-onprem-local-router = "10.0.0.0/8"
publicIP-onprem-local-router = "194.6.255.5"
s2ssharedPassconnectionKey = "Password"
############NOT USED AS OF NOW ###################
# SPOKE SET OF  VARIABLES FOR SUBNET AND COMPUTE #
##################################################
vm-jmbx-1-size-current = "Standard_DS1_v2"
vm-jmbx-1-password-current = "M0nP@ssw0rd!"
vm-jmbx-1-user-current = "demouser"
current-vnet-spoke-space = "172.16.4.0/25"
current-vnet-spoke-name = "VNet-AJN-Mgmt"
current-AzureBastion-space = "172.16.4.0/26"
current-AzureBastion-subnet-name = "AzureBastionSubnet"
current-spoke-subnet-1-space = "172.16.4.64/28"
current-spoke-subnet-1-name = "Snet-Mgmt-01"