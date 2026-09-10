variable "region" {
  description = "The region where the resources are created"
  default = "ap-southeast-1"
}


variable "environment" {
  description = "target environment"
  default = "Production"
}

variable "default_route" {
  default = "0.0.0.0/0"
}

variable "default_vpc_id" {
  default = "vpc-0d90130a42bf7e826"
}


variable "local_public_subnet" {
  default = "116.86.53.71/32"
}

variable "jump_host_public_subnet_cidr_block" {
  default = "172.31.32.0/20"
}

variable "jump_host_public_subnet_id" {
  default = "subnet-00db0f0671d8ec244"
}

variable "default_route_table_id" {
  default = "rtb-0e44a14187c593a3b"
}

variable "default_private_subnet_route_table_id" {
  default = "rtb-02b8647db29edbd89"
}

variable "dashboard_service_1_private_subnet_cidr_block" {
  default = "172.31.96.0/20"
}

variable "dashboard_service_1_private_subnet_az" {
  default = "ap-southeast-1a"
}

variable "dashboard_service_2_private_subnet_cidr_block" {
  default = "172.31.112.0/20"
}

variable "dashboard_service_2_private_subnet_az" {
  default = "ap-southeast-1b"
}


variable "counting_service_1_private_subnet_cidr_block" {
  default = "172.31.64.0/20"
}

variable "counting_service_1_private_subnet_az" {
  default = "ap-southeast-1b"
}

variable "counting_service_2_private_subnet_cidr_block" {
  default = "172.31.80.0/20"
}

variable "counting_service_2_private_subnet_az" {
  default = "ap-southeast-1c"
}

variable "default-public-subnet-1" {
  default = "subnet-00db0f0671d8ec244"
}

variable "default-public-subnet-2" {
  default = "subnet-0ebd67e612cef6ef0"
}

variable "default-public-subnet-3" {
  default = "subnet-0d2cb60e96abe216f"
}