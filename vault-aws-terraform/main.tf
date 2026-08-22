terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
       version = "5.11.0"
    }

    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "vault" {
  alias = "valut1"
  address = "http://127.0.0.1:8200"
  token = var.vault1-token
}

provider "vault" {
  alias = "valut2"
  address = "http://127.0.0.1:8202"
  token = var.vault2-token
}

# Vault 1 -> AWS Master credentials
data "vault_aws_access_credentials" "terraform-master" {
  provider = vault.valut1
  backend = "davidcloud-aws-master-account"
  role    = "terraform-role"
}

# Vault 2 -> AWS Dev credentials
data "vault_aws_access_credentials" "terraform-dev" {
  provider = vault.valut2
  backend = "davidcloud-aws-dev-account"
  role    = "terraform-role"
}

# AWS Master Account
provider "aws" {
  region     = "ap-southeast-1"
  access_key = data.vault_aws_access_credentials.terraform-master.access_key
  secret_key = data.vault_aws_access_credentials.terraform-master.secret_key
  alias = "aws-master-account"
}

# AWS Dev Account
provider "aws" {
  region     = "ap-southeast-1"
  access_key = data.vault_aws_access_credentials.terraform-dev.access_key
  secret_key = data.vault_aws_access_credentials.terraform-dev.secret_key
  alias = "aws-dev-account"
}

data "aws_caller_identity" "master" {
    provider = aws.aws-master-account
}

data "aws_caller_identity" "dev" {
    provider = aws.aws-dev-account
}

output "aws_master_account_id" {
  value = data.aws_caller_identity.master.account_id
}

output "aws_dev_account_id" {
  value = data.aws_caller_identity.dev.account_id
}