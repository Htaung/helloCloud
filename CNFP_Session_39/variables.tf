variable "region" {
  description = "The region where the resources are created"
  default     = "ap-southeast-1"
}

variable "profile" {
  default = "master-console-admin"

}

variable "public_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMjqoQ6K0dGR2kc8Vp7rm7gcY8uLfIz0y+SXy4lWerBJ"
}