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