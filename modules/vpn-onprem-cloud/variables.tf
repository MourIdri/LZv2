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
  description = ""
  #default     = "#"
}
variable "subnet_out_id_module" {
  type    = any
  default = null
}
variable "subnet_in_id_module" {
  type    = any
  default = null
}
variable "ip-in-mgmt-module" {
  type    = any
  default = null
}

variable "mgmt-passwd" {
  type    = any
  default = null
}
variable "mgmt-login" {
  type    = any
  default = null
}
variable "security_appliance_depend_on" {
  type    = any
  default = null
}
variable "mgmt-size" {
  type    = any
  default = null
}
variable "mgmt_depend_on" {
  type    = any
  default = null
}
variable "stor-log-repo" {
  type    = any
  default = null
}
variable "subnet-vpn-target-id-module" {
  type    = any
  default = null
}
variable "s2s-connection-pass" {
  type    = any
  default = null
}
variable "ipaddress-routeur-onprem-1-module" {
  type    = any
  default = null
}
variable "iprange-onprem-module" {
  type    = any
  default = null
}
variable "tags-vpn-standard-connect-module" {
  type    = any
  default = null
}
variable "tags-onprem-1-standard-connect-module" {
  type    = any
  default = null
}
variable "vpn-gw-subnet-id-output-module" {
  type    = any
  default = null
}
variable "vpn_gw_depend_on" {
  type    = any
  default = null
}
