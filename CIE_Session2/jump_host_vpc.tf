resource "aws_security_group" "jump_host_sg" {
  name        = "jump_host_sg"
  vpc_id      = var.default_vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.local_public_subnet]
  }

    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      prefix_list_ids = []
    }


  tags = {
    Name = "jump_host_sg"
  }
}


resource "aws_route_table_association" "jump_host_route_table_association" {
  subnet_id      = var.jump_host_public_subnet_id
  route_table_id = var.default_route_table_id
}
