variable "module-resource-module-rg" {
  type    = any
  default = null
}
variable "preferred-location-module" {
  description = "Location of the network"
  default = null
}
variable "azappgw_depend_on_module" {
  description = "Location of the network"
  default = null
}

variable "second-location-module" {
  description = "Location of the network"
  default = null
}
variable "current-name-convention-core-module" {
  description = "Every ressources has a core model crpc-prod-shar-hub-subnet-publicdmzin "
  default = null
}

variable "current-name-convention-core-public-module" {
  description = "Every PUBLIC accesed and resolved ressources has a core model crcprdshrhubstolog "
  default = null
}

variable "tags-AppGW-module" {
  description = "Lbastion"
  default = null
}

variable "appgw-subnet-id-output-module" {
  description = "Lbastion"
  default = null
}
