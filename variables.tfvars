############################
# Authentication variables #
############################
# Add you service endpoint access strings
azure-client-app-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-subscription-id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-client-secret-password = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
azure-tenant-id ="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
###############################
# GENERAL  Naming VARIABLES   #
###############################
preferred-location-main = "westeurope"
second-location-main = "northeurope"
current-name-convention-core-main = "ajnaz"
current-name-convention-core-public-main = "ajnaz"
############################
# GENERAL NETWRK VARIABLES #
############################
current-vnet-space = "172.16.0.0/22"
current-vnet-name  = "VNet-AJN-Hub"
current-GatewaySubnet-space = "172.16.0.0/27"
current-GatewaySubnet-subnet-name = "GatewaySubnet"
current-AzureRouteServer-space = "172.16.0.32/27"
current-AzureRouteServer-subnet-name = "Snet-AzRouter"
current-AzureFirewall-space = "172.16.2.0/25"
current-AzureFirewall-subnet-name = "AzureFirewallSubnet"
current-AzureBastion-space = "172.16.2.128/26"
current-AzureBastion-subnet-name = "AzureBastionSubnet"
current-AzureAppGW-space = "172.16.0.128/25"
current-AzureAppGW-subnet-name = "Snet-AppGW"
current-SharedServices-space = "172.16.0.64/27"
current-SharedServices-subnet-name = "Snet-SS"
current-Mgmt-space = "172.16.2.192/26"
current-Mgmt-subnet-name = "Snet-Mgmt"
############################
# GENERAL VPN S2S VARIABLE #
############################
VPN-Session-IPRange-onprem-local-router = "10.2.2.0/24"
publicIP-onprem-local-router = "54.45.34.67"
s2ssharedPassconnectionKey = "Password"
############NOT USED AS OF NOW ################
# GENERAL COMPUTE VARIABLE #
###############################################
#LOGIN PASSWORDS