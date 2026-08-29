output "master_key_pair_id" {
  value = aws_key_pair.this[0].id
}

output "master_key_arn" {
  value = aws_key_pair.this[0].arn
}

output "master_key_pair_name" {
  value = aws_key_pair.this[0].key_name
}

output "master_key_type" {
  value = aws_key_pair.this[0].key_type
}

output "master_key_public_key" {
  value = aws_key_pair.this[0].public_key
}
