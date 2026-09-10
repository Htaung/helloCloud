data "aws_ami" "hellocloud" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

   #For Ubuntu 22.04 in Singapore, use Canonical's owner ID:
    owners = ["099720109477"]
}

  