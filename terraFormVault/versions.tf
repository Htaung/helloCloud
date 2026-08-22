terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "5.11.0"
    }
  }
}

provider "vault" {
  address = "127.0.0.1:8200"
  token = var.vault1-token
  alias = "valut1"
}

provider "vault" {
  address = "127.0.0.1:8202"
  token = var.vault2-token
  alias = "valut2"
}