data "aws_caller_identity" "master" {
    provider = aws.master
}


data "aws_caller_identity" "dev" {
    provider = aws.dev

}


data "aws_caller_identity" "prod" {
    provider = aws.prod
}