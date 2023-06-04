variable "module-resource-module-rg" {
  type    = any
  default = null
}
variable "preferred-location-module" {
  description = "Location of the network"
  default = null
}
variable "azbastion_depend_on_module" {
  description = "Location of the network"
  default = null
}
variable "bastion-subnet-id-output-module" {
  description = "Lbastion"
  default = null
}
variable "tags-bastion-module" {
  description = "Lbastion"
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


