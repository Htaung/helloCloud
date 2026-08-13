terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  profile = "aws-master"
  alias = "master"
}

provider "aws" {
  profile = "aws-master"
  alias = "singapore"
  region = "ap-southeast-1"
}

provider "aws" {
  profile = "aws-dev"
  alias = "dev"
}

provider "aws" {
  profile = "aws-prod"
  alias = "prod"
}

provider "aws" {
  profile = "aws-prod"
  alias = "japan"
  region = "ap-southeast-1"
}

