variable "region" {
  description = "The region where the resources are created"
  default = "ap-southeast-1"
}

variable "profile" {
    default = "master-console-admin"
  
}

variable "deployment_name" {
 default = "hellocloud-tf"
}


variable "create_ec2_ssh_keypair" {
  type = bool
  description = "booelan to create EC2 SSH Key pair."
  default = true
}


variable "common-tags" {
 type = map(string)
 description = "map of common tags for all taggable AWS resources"
 default = {
  App = "Production-prereqs"
  Environment = "Production"
  Owner = "AA"
 }
}
