data "aws_iam_user" "aws-master" {
  user_name = "aws-master"
}

data "aws_iam_user" "aws-dev" {
  user_name = "aws-dev"
}

data "aws_iam_user" "aws-prod" {
  user_name = "aws-prod"
}
