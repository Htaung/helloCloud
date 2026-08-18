output "master_programmatic_account_id" {
  value = data.aws_caller_identity.master.account_id
}

output "master_programmatic_caller_arn" {
  value = data.aws_caller_identity.master.arn
}

output "master_programmatic_caller_user" {
  value = data.aws_caller_identity.master.user_id
}