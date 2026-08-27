output "master_ed25519_key_pair_id" {
  value = aws_key_pair.master_ed25519_key.id
}

output "master_ed25519_key_arn" {
  value = aws_key_pair.master_ed25519_key.arn
}

output "master_ed25519_key_pair_name" {
  value = aws_key_pair.master_ed25519_key.key_name
}

output "master_ed25519_key_key_type" {
  value = aws_key_pair.master_ed25519_key.key_type
}

output "master_ed25519_key_public_key" {
  value = aws_key_pair.master_ed25519_key.public_key
}