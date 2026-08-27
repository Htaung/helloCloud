resource "aws_key_pair" "master-key-pair" {
  key_name   = "master-singapore-key"
  public_key = var.public_key
}