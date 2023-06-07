############################
# Authentication variables #
############################
# Add you service endpoint access strings
azure-client-app-id = "9f93e56b-9e76-4477-956d-1254f6654968"
azure-subscription-id = "474d0847-4d68-46c6-8c21-a4ff1f238293"
azure-client-secret-password = "izZ8Q~6dL6z~6fIIvLaxWBBHEvFn93RU0pt5icQ7"
azure-tenant-id ="8d4c969b-1f65-483b-b58a-4765b08a2829"
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
domain-private-dns-domain-for-vnet-main  = "ajn.net"
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