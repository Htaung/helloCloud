resource "aws_instance" "hellocloud" {
  ami           = data.aws_ami.hellocloud.id
  instance_type = "t3.micro"

  key_name = aws_key_pair.this.key_name
  subnet_id = aws_subnet.hellocloud.id
  vpc_security_group_ids = ["${aws_security_group.hellocloud.id}"]
  associate_public_ip_address = true


  tags = {
    Name = "${var.prefix}-hellocloud-instance"
    Department = "${var.department}"
  }
  
}

