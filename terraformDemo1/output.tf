output "aws_master_user_name" {
  description = "IAM user name for aws-master"
  value       = data.aws_iam_user.aws-master.user_name
}

output "aws_master_user_id" {
  description = "IAM user ID for aws-master"
  value       = data.aws_iam_user.aws-master.user_id
}

output "aws_master_user_arn" {
  description = "IAM user ARN for aws-master"
  value       = data.aws_iam_user.aws-master.arn
}

output "aws_dev_user_name" {
  description = "IAM user name for aws-dev"
  value       = data.aws_iam_user.aws-dev.user_name
}

output "aws_dev_user_id" {
  description = "IAM user ID for aws-dev"
  value       = data.aws_iam_user.aws-dev.user_id
}

output "aws_dev_user_arn" {
  description = "IAM user ARN for aws-dev"
  value       = data.aws_iam_user.aws-dev.arn
}

output "aws_prod_user_name" {
  description = "IAM user name for aws-prod"
  value       = data.aws_iam_user.aws-prod.user_name
}

output "aws_prod_user_id" {
  description = "IAM user ID for aws-prod"
  value       = data.aws_iam_user.aws-prod.user_id
}

output "aws_prod_user_arn" {
  description = "IAM user ARN for aws-prod"
  value       = data.aws_iam_user.aws-prod.arn
}
