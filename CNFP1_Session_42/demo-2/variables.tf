variable "aws_region" {
  description = "The region where the resources are created"
  default = "ap-southeast-1"
}

variable "profile" {
    default = "master-console-admin"
}

variable "friendly_name_prefix" {
  type = string
  description = "Friendly Name prefix used for tagging and naming AWS resource"
  default = "AA"
}

variable "common-tags" {
 type = map(string)
 description = "map of common tags for all taggable AWS resources"
 default = {
  App = "Production-prereqs"
  Environment = "Production"
  Owner = "Aung"
 }
}


#---------------------------------------------------------------------------------
# EC2 SSH Key Pairs
#---------------------------------------------------------------------------------

variable "create_ec2_ssh_keypair" {
  type = bool
  description = "booelan to create EC2 SSH Key pair."
  default = true
}

variable "ec2_ssh_keypair_name" {
  type = string
  description = "Name of EC2 SSH Key Pair"
  default = "ec2-keypair"
}

variable "ec2_ssh_public_key" {
  type = string
  description = "Public key of EC2 SSH"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3rWcU/MWFTp4Bhd48XFRAgrjzaSgMoI+sXPgrb9m37QN3VmzcY8O2TtCu1H9Qq2s6sA87j6wogZVcFoJjCD1X1VFdYwY5K4gNxShiu3wmFWNMDVj4rXLYNW6yVxQ0zM13vhKyf7Lvc9kNe6sCM9giLCxZa6nbfVIMi6awnRQw0z49LSqfOiqhpssfPYJCaiDzXCE46TcP3RAL57lpu7xjdkhRGYW59I26FUH+xfmiLMk6/RGTN424xqxzkH2h+QuLvN3IPfiJHqabLJYSM+dVKHbmIysotlXFNTJZYoe5aPGO+hGbE/Wgz8GCm0spPriGSZq1gRPWYyfuMwJ7zG/6kCJIsuHIVpGddStOM2pEuFHfONpOipVQnBZhcWg15FbzXbvFdeWkvkHSHxS+p1tJx0YL0fXuIrZiYmvT+k7CeQEhPOZKzCeE58vLaJ/F9VtnwspRG4VmtPSXM0TApIseXJPSnKmTnUQPKDF2FYol0reJp5oMvvf32i2EmlWWaiE="
}
