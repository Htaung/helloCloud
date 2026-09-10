resource "aws_instance" "dashboard_service_1_instance" {
  ami           = data.aws_ami.hellocloud.id
  instance_type = "t3.micro"

  key_name = aws_key_pair.this.key_name
  subnet_id = aws_subnet.dashboard_service_1_private_subnet.id
  vpc_security_group_ids = ["${aws_security_group.dashboard_sg_1.id}"]


  tags = {
    Name = "dashboard_service_1_instance"
  }
  
}

resource "aws_instance" "dashboard_service_2_instance" {
  ami           = data.aws_ami.hellocloud.id
  instance_type = "t3.micro"

  key_name = aws_key_pair.this.key_name
  subnet_id = aws_subnet.dashboard_service_2_private_subnet.id
  vpc_security_group_ids = ["${aws_security_group.dashboard_sg_2.id}"]


  tags = {
    Name = "dashboard_service_2_instance"
  }
  
}