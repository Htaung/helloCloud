# output "lease_id" {
#   value = data.vault_aws_access_credentials.terraform.lease_id
# }

# output "lease_duration" {
#   value = data.vault_aws_access_credentials.terraform.lease_duration
# }


output "auth_backends" {
  value = data.vault_auth_backends.all.paths
}