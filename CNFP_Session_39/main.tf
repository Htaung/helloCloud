resource "aws_key_pair" "master_ed25519_key" {
  key_name   = "master_ed25519_key"
  public_key = var.public_key
}