############################
# Authentication variables #
############################
# Add you service endpoint access strings
# Subscription default 
azure-default-client-app-id = "6f225529-42dc-4862-bd43-1723360343df"
azure-default-subscription-id = "d2bdaf1c-f854-4d7d-a579-0d4b709efdeb"
azure-default-client-secret-password = "2hD8Q~YJhlZy5c2yrGxLJ~1bMXxBB0vU.bwTMchU"
azure-default-tenant-id ="16b3c013-d300-468d-ac64-7eda0820b6d3"
# Subscription Hub
azure-AJN-Hub-client-app-id = "6f225529-42dc-4862-bd43-1723360343df"
azure-AJN-Hub-subscription-id = "d2bdaf1c-f854-4d7d-a579-0d4b709efdeb"
azure-AJN-Hub-client-secret-password = "2hD8Q~YJhlZy5c2yrGxLJ~1bMXxBB0vU.bwTMchU"
azure-AJN-Hub-tenant-id ="16b3c013-d300-468d-ac64-7eda0820b6d3"
# Subscription management 
azure-AJN-Management-client-app-id = "f5250635-931f-4784-bdde-a9352d45927b"
azure-AJN-Management-subscription-id = "3cae269c-98c8-4608-b053-a0b6d44f9974"
azure-AJN-Management-client-secret-password = "8L88Q~5c.6BSInU25x9hvjJqgmUY7dRikCxrLauS"
azure-AJN-Management-tenant-id ="16b3c013-d300-468d-ac64-7eda0820b6d3"
# Subscription Backup
azure-AJN-Backup-client-app-id = "6f225529-42dc-4862-bd43-1723360343df"
azure-AJN-Backup-subscription-id = "d2bdaf1c-f854-4d7d-a579-0d4b709efdeb"
azure-AJN-Backup-client-secret-password = "2hD8Q~YJhlZy5c2yrGxLJ~1bMXxBB0vU.bwTMchU"
azure-AJN-Backup-tenant-id ="16b3c013-d300-468d-ac64-7eda0820b6d3"

###############################
# GENERAL  Naming VARIABLES   #
###############################
preferred-location-main = "westeurope"
second-location-main = "northeurope"
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
current-AzureBastion-space = "172.16.2.128/26"
current-AzureBastion-subnet-name = "AzureBastionSubnet"
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
#LOGIN PASSWORDS
vm-jmbx-1-size-current = "Standard_DS1_v2"
vm-jmbx-1-password-current = "M0nP@ssw0rd!"
vm-jmbx-1-user-current = "demouser"
current-vnet-spoke-space = "172.16.4.0/27"
current-vnet-spoke-name = "VNet-AJN-Mgmt"
current-spoke-subnet-1-space = "172.16.4.0/28"
current-spoke-subnet-1-name = "Snet-Mgmt"

