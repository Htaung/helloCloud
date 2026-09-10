variable "region" {
  description = "The region where the resources are created"
  default = "ap-southeast-1"
}

variable "address_space" {
  description = "This address space is used by the VPC"
  default = "10.0.0.0/16"
}

variable "prefix" {
  description = "This prefix will be included in the name of tag"
}

variable "environment" {
  description = "target environment"
  default = "Production"
}

variable "subnet_prefix" {
  description = "The address prefix to use for subnet"
  default = "10.0.10.0/24"
}

variable "department" {
  description = "Department"
}