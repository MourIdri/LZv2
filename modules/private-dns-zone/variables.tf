variable "module-resource-module-rg" {
  type    = any
  default = null
}
variable "preferred-location-module" {
  description = ""
  default = null
}

variable "current-name-convention-core-module" {
  description = " "
  default = null
}
variable "current-name-convention-core-public-module" {
  type    = any
  default = null
}

variable "module-domain-private-dns-domain-for-vnet-module" {
  description = " "
  default = null
}
variable "pdnsz_depend_on_module" {
  type    = any
  default = null
}
variable "tags-pdnsz-logging-module" {
  type    = any
  default = null
}

variable "hub-vnet-id-output-module" {
  type    = any
  default = null
}
