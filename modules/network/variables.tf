
############################
# GENERAL TENANT VARIABLES #
############################

variable "preferred-location-module" {
  description = "Location of the network"
  default     = "westeurope"
}
variable "current-name-convention-core-module" {
  description = "Every ressources has a core model crpc-prod-shar-hub-subnet-publicdmzin "
  #default     = "crpc-prod-shar-hub"
}
variable "current-name-convention-core-public-module" {
  description = "Every PUBLIC accesed and resolved ressources has a core model crcprdshrhubstolog "
  #default     = "crcprdshrhub"
}
variable "tags-vnet-module" {
  type    = any
  default = null
}
variable "vnet_depend_on_module" {
  type    = any
  default = null
}
variable "ip-range-vnet-module" {
  description = "IP range used to delimite the HUB"
  type    = any
  default = null
}
variable "name-vnet-module" {
  description = "Vnet name "
  type    = any
  default = null
}
variable "ip-range-GatewaySubnet-module" {
  description = "IP range used to delimite the GatewaySubnet"
  type    = any
  default = null
}
variable "snet-name-GatewaySubnet-module" {
  description = "GatewaySubnet name "
  type    = any
  default = null
}
variable "ip-range-AzureRouteServer-module" {
  description = "IP range used to delimite the AzureRouteServer"
  type    = any
  default = null
}
variable "snet-name-AzureRouteServer-module" {
  description = "AzureRouteServer name "
  type    = any
  default = null
}
variable "ip-range-AzureFirewall-module" {
  description = "IP range used to delimite the AzureFirewall"
  type    = any
  default = null
}
variable "snet-name-AzureFirewall-module" {
  description = "AzureFirewall name "
  type    = any
  default = null
}
variable "ip-range-AzureBastion-module" {
  description = "IP range used to delimite the AzureBastion"
  type    = any
  default = null
}
variable "snet-name-AzureBastion-module" {
  description = "AzureBastion name "
  type    = any
  default = null
}
variable "ip-range-AzureAppGW-module" {
  description = "IP range used to delimite the AzureAppGW"
  type    = any
  default = null
}
variable "snet-name-AzureAppGW-module" {
  description = "AzureAppGW name "
  type    = any
  default = null
}
variable "ip-range-Mgmt-module" {
  description = "IP range used to delimite the Mgmt"
  type    = any
  default = null
}
variable "snet-name-Mgmt-module" {
  description = "Mgmt name "
  type    = any
  default = null
}
variable "ip-range-SharedServices-module" {
  description = "IP range used to delimite the SharedServices"
  type    = any
  default = null
}
variable "snet-name-SharedServices-module" {
  description = "SharedServices name "
  type    = any
  default = null
} 
variable "module-resource-module-rg" {
  description = "RG for Vnet "
  type    = any
  default = null
}
variable "nsg_depends_on" {
  type    = any
  default = null
}
variable "subnet-mgmt-port-range-module" {
  type    = any
  default = null
}
variable "ddos-plan-id-output-module" {
  type    = any
  default = null
}

