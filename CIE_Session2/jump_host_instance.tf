resource "aws_instance" "jump_host_instance" {
  ami           = data.aws_ami.hellocloud.id
  instance_type = "t3.micro"

  key_name = aws_key_pair.this.key_name
  subnet_id = var.jump_host_public_subnet_id
  vpc_security_group_ids = ["${aws_security_group.jump_host_sg.id}"]


  tags = {
    Name = "jump_host_instance"
  }
  
}