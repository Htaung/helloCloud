resource "aws_subnet" "counting_service_2_private_subnet" {
  vpc_id     = var.default_vpc_id
  cidr_block = var.counting_service_2_private_subnet_cidr_block
  availability_zone = var.counting_service_2_private_subnet_az
  
  tags = {
    Name = "counting_service_2_private_subnet"
  }
}

resource "aws_security_group" "counting_sg_2" {
  name        = "counting_sg_2"
  vpc_id      = var.default_vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.jump_host_public_subnet_cidr_block]
  }

   ingress {
    description     = "From ALB on service ports"
    from_port       = 5000
    to_port         = 5000
    protocol        = "tcp"
    security_groups = [aws_security_group.counting_alb_sg.id]
  }


  tags = {
    Name = "counting_security_group_2"
  }
}


resource "aws_route_table_association" "counting_service_2_route_table_association" {
  subnet_id      = aws_subnet.counting_service_2_private_subnet.id
  route_table_id = var.default_private_subnet_route_table_id
}
