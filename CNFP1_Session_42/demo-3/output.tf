output "hellocloud-tf_key_pair_id" {
  value = one(aws_key_pair.this[*].id)
}

output "hellocloud-tf_key_arn" {
  value = one(aws_key_pair.this[*].arn)
}

output "hellocloud-tf_key_pair_name" {
  value = one(aws_key_pair.this[*].key_name)
}

output "hellocloud-tf_key_type" {
  value = one(aws_key_pair.this[*].key_type)
}

output "hellocloud-tf_public_key" {
  value = one(aws_key_pair.this[*].public_key)
}

output "hellocloud-tf_private_key" {
  value = tls_private_key.ssh.private_key_openssh
  sensitive = true
}