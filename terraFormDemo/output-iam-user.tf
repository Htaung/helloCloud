output "user_id" {
  value       = data.aws_iam_user.aws-master.user_id
  description = "AWS Master User Id"
}

output "arn" {
  value       = data.aws_iam_user.aws-master.arn
  description = "AWS Master ARN"
}

output "id" {
  value       = data.aws_iam_user.aws-master.id
  description = "AWS Master Id"
}
