
############################
# GENERAL TENANT VARIABLES #
############################
variable "preferred-location-module" {
  description = "Location global variable "
  #default     = "#"
}
variable "module-resource-module-rg" {
  description = "Location local module "
  #default     = ""
}
variable "current-name-convention-core-module" {
  description = " "
  #default     = ""
}

variable "current-name-convention-core-public-module" {
  type    = any
  default = null
}
variable "root-name-subnet-module" {
  type    = any
  default = null
}
variable "iprange-subnet-module" {
  type    = any
  default = null
}
variable "portrange-subnet-module" {
  type    = any
  default = null
}
variable "subnet_depend_on_module" {
  type    = any
  default = null
}
variable "fw-private-ip-id-output-module" {
  type    = any
  default = null
}
variable "udr_depend_on_module" {
  type    = any
  default = null
}
variable "source-subnet-id-output-module" {
  type    = any
  default = null
}
variable "target-subnet-LZ-Subnet1-range-for-default-udr" {
  type    = any
  default = null
}
variable "target-subnet-LZ-Subnet1-name-for-default-udr" {
  type    = any
  default = null
}
variable "target-subnet-LZ-Subnet2-range-for-default-udr" {
  type    = any
  default = null
}
variable "target-subnet-LZ-Subnet2-name-for-default-udr" {
  type    = any
  default = null
}
variable "source-subnet-id-output-name-module" {
  type    = any
  default = null
}


