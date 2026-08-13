data "aws_vpc" "singapore_vpc" {
    provider = aws.singapore
    default = true
}


data "aws_vpc" "japan_vpc" {
    provider = aws.japan
    default = true
}