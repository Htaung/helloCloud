terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  alias   = "master"
  region  = "ap-southeast-1"
  profile = "aws-master"
}

provider "aws" {
  alias   = "dev"
  region  = "ap-southeast-1"
  profile = "aws-dev"
}

provider "aws" {
  alias   = "prod"
  region  = "ap-southeast-1"
  profile = "aws-prod"
}


data "aws_caller_identity" "master" {
  provider = aws.master
}

data "aws_caller_identity" "dev" {
  provider = aws.dev
}

data "aws_caller_identity" "prod" {
  provider = aws.prod
}


output "aws-master-account_id" {
  value = data.aws_caller_identity.master.account_id
}

output "aws_master_caller_arn" {
  value = data.aws_caller_identity.master.arn
}

output "aws_master_caller_user" {
  value = data.aws_caller_identity.master.user_id
}

output "aws-dev-account_id" {
  value = data.aws_caller_identity.dev.account_id
}

output "aws_dev_caller_arn" {
  value = data.aws_caller_identity.dev.arn
}

output "aws_dev_caller_user" {
  value = data.aws_caller_identity.dev.user_id
}

output "aws-prod-account_id" {
  value = data.aws_caller_identity.prod.account_id
}

output "aws_prod_caller_arn" {
  value = data.aws_caller_identity.prod.arn
}

output "aws_prod_caller_user" {
  value = data.aws_caller_identity.prod.user_id
}