############################
# Authentication variables #
############################
# Add you service endpoint access strings

variable "azure-client-app-id" {
    default="XXXXXXXXXX-XXXXXXXXXX-XXXXXXXXXX-XXXXXXXXXX-XXXXXXXXXX"
    description="The Client ID of the Service Principal."
}
variable "azure-subscription-id" {
    default="XXXXXXXXXX-XXXXXXXXXX-XXXXXXXXXX-XXXXXXXXXX-XXXXXXXXXX"
    description="The ID of the Azure Subscription in which to run the Acceptance Tests."
}
variable "azure-client-secret-password" {
    default="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    description="The Client Secret associated with the Service Principal."
}

variable "azure-tenant-id" {
    default="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    description="The Tenant ID to use."
}

############################
# GENERAL TENANT VARIABLES #
############################

variable "preferred-location-main" {
  description = "Location of the network"
  default     = "westeurope"
}

variable "second-location-main" {
  description = "Location of the network"
  default     = "northeurope"
}
variable "current-name-convention-core-main" {
  description = "Every ressources has a core model crpc-prod-shar-hub-subnet-publicdmzin "
  default     = "ajnaz"
}

variable "current-name-convention-core-public-main" {
  description = "Every PUBLIC accesed and resolved ressources has a core model crcprdshrhubstolog "
  default     = "ajnaz"
}
############################
# GENERAL NETWRK VARIABLES #
############################
variable "current-vnet-space" {
  description = "defining the vnetspace using a variable"
  type = any
  default     = "172.16.0.0/22"
}
variable "current-vnet-name" {
  description = "defining the name using a variable"
  type = any
  default     = "VNet-AJN-Hub"
}
variable "current-GatewaySubnet-space" {
  description = "defining the GatewaySubnet using a variable"
  type = any
  default     = "172.16.0.0/27"
}
variable "current-GatewaySubnet-subnet-name" {
  description = "defining the name using a variable"
  type = any
  default     = "GatewaySubnet"
}
variable "current-AzureRouteServer-space" {
  description = "defining the AzureRouteServer using a variable"
  type = any
  default     = "172.16.0.32/27"
}
variable "current-AzureRouteServer-subnet-name" {
  description = "defining the name using a variable"
  type = any
  default     = "Snet-AzRouter"
}
variable "current-AzureFirewall-space" {
  description = "defining the AzureFirewall using a variable"
  type = any
  default     = "172.16.2.0/25"
}
variable "current-AzureFirewall-subnet-name" {
  description = "defining the name using a variable"
  type = any
  default     = "AzureFirewallSubnet"
}
variable "current-AzureBastion-space" {
  description = "defining the AzureBastion using a variable"
  type = any
  default     = "172.16.2.128/26"
}
variable "current-AzureBastion-subnet-name" {
  description = "defining the name using a variable"
  type = any
  default     = "AzureBastionSubnet"
}
variable "current-AzureAppGW-space" {
  description = "defining the AzureAppGW using a variable"
  type = any
  default     = "172.16.0.128/25"
}
variable "current-AzureAppGW-subnet-name" {
  description = "defining the name using a variable"
  type = any
  default     = "Snet-AppGW"
}
variable "current-SharedServices-space" {
  description = "defining the SharedServices using a variable"
  type = any
  default     = "172.16.0.64/27"
}
variable "current-SharedServices-subnet-name" {
  description = "defining the name using a variable"
  type = any
  default     = "Snet-SS"
}
variable "current-Mgmt-space" {
  description = "defining the Mgmt using a variable"
  type = any
  default     = "172.16.2.192/26"
}
variable "current-Mgmt-subnet-name" {
  description = "defining the name using a variable"
  type = any
  default     = "Snet-Mgmt"
}
############################
# GENERAL VPN S2S VARIABLE #
############################
variable "VPN-Session-IPRange-onprem-local-router" {
  description = ""
  type = any
  default     = "10.2.2.0/24"
}
variable "publicIP-onprem-local-router" {
  description = "VPN-Session-IPRange-onprem-local-router"
  type = any
  default     = "54.45.34.67"
}
variable "s2ssharedPassconnectionKey" {
  description = "VPN-Session-IPRange-onprem-local-router"
  type = any
  default     = "Password"
}

############################
# GENERAL COMPUTE VARIABLE #
############################
#LOGIN PASSWORDS
variable "genericusername" {
  description = "Username for Virtual Machines"
  default     = "demouser"
}
variable "genericpassword" {
  description = "Password for Virtual Machines"
  default     = "M0nP@ssw0rd!"
}
#INSTANCE CATALOGUE 
variable "vmsize_small_1_2" {
  description = "Size of the VMs"
  default     = "Standard_F1s"
}
variable "vmsize_small_1_4" {
  description = "Size of the VMs"
  default     = "Standard_DS1_v2"
}
variable "vmsize_medium_2_4" {
  description = "Size of the VMs"
  default     = "Standard_F2s_v2"
}
variable "vmsize_medium_2_8" {
  description = "Size of the VMs"
  default     = "Standard_D2s_v3"
}
variable "vmsize_high_4_8" {
  description = "Size of the VMs"
  default     = "Standard_F4s_v2"
}
variable "vmsize_high_4_16" {
  description = "Size of the VMs"
  default     = "Standard_D4s_v3"
}
