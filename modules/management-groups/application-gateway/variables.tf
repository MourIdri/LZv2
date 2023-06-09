variable "module-resource-module-rg" {
  type    = any
  default = null
}

variable "azappgw_depend_on_module" {
  type    = any
  default = null
}
variable "preferred-location-module" {
  type    = any
  default = null
}

variable "current-name-convention-core-module" {
  description = " "
  #default     = ""
}

variable "current-name-convention-core-public-module" {
  type    = any
  default = null
}

variable "tags-AppGW-module" {
  type    = any
  default = null
}

variable "appgw-subnet-id-output-module" {
  type    = any
  default = null
}
