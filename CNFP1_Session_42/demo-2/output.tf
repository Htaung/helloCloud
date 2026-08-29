output "master_ed25519_key_pair_id" {
  value = aws_key_pair.this[count].id
}

output "master_ed25519_key_arn" {
  value = aws_key_pair.this[count].arn
}

output "master_ed25519_key_pair_name" {
  value = aws_key_pair.this[count].key_name
}

output "master_ed25519_key_key_type" {
  value = aws_key_pair.this[count].key_type
}

output "master_ed25519_key_public_key" {
  value = aws_key_pair.this[count].public_key
}