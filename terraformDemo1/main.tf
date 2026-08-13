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
  region = "ap-southeast-1"
}

data "aws_iam_user" "master" {
  user_name = "aws-master"
}

data "aws_iam_user" "dev" {
  user_name = "aws-dev"
}

data "aws_iam_user" "prod" {
  user_name = "aws-prod"
}

output "aws_master_user_name" {
  value = data.aws_iam_user.master.user_name
}

output "aws_dev_user_name" {
  value = data.aws_iam_user.dev.user_name
}

output "aws_prod_user_name" {
  value = data.aws_iam_user.prod.user_name
}