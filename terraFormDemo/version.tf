terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["/home/aung/.aws/conf"]
  shared_credentials_files = ["/home/aung/.aws/credentials"]
  profile                  = "aws-master"
  alias                    = "aws-master"
  region                   = "ap-southeast-1"
}

provider "aws" {
  shared_config_files      = ["/home/aung/.aws/conf"]
  shared_credentials_files = ["/home/aung/.aws/credentials"]
  profile                  = "aws-dev"
  alias                    = "aws-dev"
  region                   = "ap-southeast-2"
}

provider "aws" {
  shared_config_files      = ["/home/aung/.aws/conf"]
  shared_credentials_files = ["/home/aung/.aws/credentials"]
  profile                  = "aws-prod"
  alias                    = "aws-prod"
  region                   = "ap-southeast-2"
}
