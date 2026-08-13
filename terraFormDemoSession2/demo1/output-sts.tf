# aws-master account
output "master_user_id" {
  description = "User id of aws-master"
  value = data.aws_caller_identity.master.user_id
}

output "master_id" {
  description = "Account id of aws-master"
  value = data.aws_caller_identity.master.id
}

output "master_arn" {
  description = "arn of aws-master"
  value = data.aws_caller_identity.master.arn
}

output "master_singapore_vpc" {
  description = "vpc of singapore"
  value = data.aws_vpc.singapore_vpc
}

# aws-master account
output "dev_user_id" {
  description = "User id of aws-dev"
  value = data.aws_caller_identity.dev.user_id
}

output "dev_id" {
  description = "Account id of dev-master"
  value = data.aws_caller_identity.dev.id
}

output "dev_arn" {
  description = "arn of aws-dev"
  value = data.aws_caller_identity.dev.arn
}


# aws-prod account
output "prod_user_id" {
  description = "User id of aws-prod"
  value = data.aws_caller_identity.prod.user_id
}

output "prod_id" {
  description = "Account id of prod-master"
  value = data.aws_caller_identity.prod.id
}

output "prod_arn" {
  description = "arn of aws-prod"
  value = data.aws_caller_identity.prod.arn
}

output "prod_japan_vpc" {
  description = "vpc of Japan"
  value = data.aws_vpc.japan_vpc
}
