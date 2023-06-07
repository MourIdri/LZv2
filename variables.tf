############################
# Authentication variables #
############################
# Add you service endpoint access strings

variable "azure-client-app-id" {
    description="The Client ID of the Service Principal."
}
variable "azure-subscription-id" {
    description="The ID of the Azure Subscription in which to run the Acceptance Tests."
}
variable "azure-client-secret-password" {
    description="The Client Secret associated with the Service Principal."
}
variable "azure-tenant-id" {
    description="The Tenant ID to use."
}

############################
# GENERAL TENANT VARIABLES #
############################

variable "preferred-location-main" {
  description = "Location of the network"
}

variable "second-location-main" {
  description = "Location of the network"
}
variable "current-name-convention-core-main" {
  description = "Every ressources has a core name "
}

variable "current-name-convention-core-public-main" {
  description = "Every PUBLIC accesed and resolved ressources has a core  name "
}
############################
# GENERAL NETWRK VARIABLES #
############################
variable "current-vnet-space" {
  description = "defining the vnetspace using a variable"
  type = any
}
variable "current-vnet-name" {
  description = "defining the name using a variable"
  type = any
}
variable "current-GatewaySubnet-space" {
  description = "defining the GatewaySubnet using a variable"
  type = any
}
variable "current-GatewaySubnet-subnet-name" {
  description = "defining the GatewaySubnet name using a variable"
  type = any
  #default     = "GatewaySubnet"
}
variable "current-AzureRouteServer-space" {
  description = "defining the AzureRouteServer using a variable"
  type = any
}
variable "current-AzureRouteServer-subnet-name" {
  description = "defining the AzureRouteServer name using a variable"
  type = any
}
variable "current-AzureFirewall-space" {
  description = "defining the AzureFirewall using a variable"
  type = any
}
variable "current-AzureFirewall-subnet-name" {
  description = "defining the AzureFirewall name using a variable"
  type = any
}
variable "current-AzureBastion-space" {
  description = "defining the AzureBastion using a variable"
  type = any
}
variable "current-AzureBastion-subnet-name" {
  description = "defining the AzureBastion name using a variable"
  type = any
}
variable "current-AzureAppGW-space" {
  description = "defining the AzureAppGW using a variable"
  type = any
}
variable "current-AzureAppGW-subnet-name" {
  description = "defining the AzureAppGW name using a variable"
  type = any
}
variable "current-SharedServices-space" {
  description = "defining the SharedServices using a variable"
  type = any
}
variable "current-SharedServices-subnet-name" {
  description = "defining the SharedServices name using a variable"
  type = any
}
variable "current-Mgmt-space" {
  description = "defining the Mgmt using a variable"
  type = any
  #default     = "172.16.2.192/26"
}
variable "current-Mgmt-subnet-name" {
  description = "defining the Mgmt name using a variable"
  type = any
}
variable "domain-private-dns-domain-for-vnet-main" {
  description = "defining the Mgmt name using a variable"
  type = any
}
############################
# GENERAL VPN S2S VARIABLE #
############################
variable "VPN-Session-IPRange-onprem-local-router" {
  description = "IP range for onprem Subnet range "
  type = any
}
variable "publicIP-onprem-local-router" {
  description = "VPN-Session- public IP onprem -local-router"
  type = any
}
variable "s2ssharedPassconnectionKey" {
  description = "VPN-Session-passphrase"
  type = any
}

############NOT USED AS OF NOW ################
# GENERAL COMPUTE VARIABLE #
###############################################
#LOGIN PASSWORDS