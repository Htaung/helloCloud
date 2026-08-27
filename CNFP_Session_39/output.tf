output "master_key_pair_id" {
  value = aws_key_pair.master-key-pair.id
}

output "master_key_pair_arn" {
  value = aws_key_pair.master-key-pair.arn
}

output "master_key_pair_key_name" {
  value = aws_key_pair.master-key-pair.key_name
}

output "master_key_pair_key_type" {
  value = aws_key_pair.master-key-pair.key_type
}

output "master_key_pair_public_key" {
  value = aws_key_pair.master-key-pair.public_key
}