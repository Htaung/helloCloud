resource "aws_instance" "counting_service_1_instance" {
  ami           = data.aws_ami.hellocloud.id
  instance_type = "t3.micro"

  key_name = aws_key_pair.this.key_name
  subnet_id = aws_subnet.counting_service_1_private_subnet.id
  vpc_security_group_ids = ["${aws_security_group.counting_sg_1.id}"]


  tags = {
    Name = "counting_service_1_instance"
  }
  
}

resource "aws_instance" "counting_service_2_instance" {
  ami           = data.aws_ami.hellocloud.id
  instance_type = "t3.micro"

  key_name = aws_key_pair.this.key_name
  subnet_id = aws_subnet.counting_service_2_private_subnet.id
  vpc_security_group_ids = ["${aws_security_group.counting_sg_2.id}"]


  tags = {
    Name = "counting_service_2_instance"
  }
  
}
