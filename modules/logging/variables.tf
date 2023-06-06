variable "preferred-location-module" {
  type    = any
  default = null
}
variable "module-resource-module-rg" {
  type    = any
  default = null
}
variable "current-name-convention-core-module" {
  type    = any
  default = null
}

variable "current-name-convention-core-public-module" {
  type    = any
  default = null
}

variable "preferred-tier-storage-module" {
  description = "preferred tier  "
  default     = "Standard"
}

variable "preferred-tier-storage-replication-module" {
  description = " replication "
  default     = "LRS"
}
variable "tags-sto-logging-module" {
  type    = any
  default = null
}
variable "stoc_depend_on_module" {
  type    = any
  default = null
}
variable "tags-repo-logging-module" {
  type    = any
  default = null
}
variable "logacc_depend_on_module" {
  type    = any
  default = null
}
variable "devops_project_object_id" {
  type    = any
  default = null
}
