output "master_ed25519_key_pair_id" {
  value = aws_key_pair.this.id
}

output "master_ed25519_key_arn" {
  value = aws_key_pair.this.arn
}

output "master_ed25519_key_pair_name" {
  value = aws_key_pair.this.key_name
}

output "master_ed25519_key_key_type" {
  value = aws_key_pair.this.key_type
}

output "master_ed25519_key_public_key" {
  value = aws_key_pair.this.public_key
}

output "master_ed25519_key_private_key" {
  value = tls_private_key.ssh.private_key_openssh
  sensitive = true
}