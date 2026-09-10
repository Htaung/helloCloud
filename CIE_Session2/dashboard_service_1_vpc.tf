resource "aws_subnet" "dashboard_service_1_private_subnet" {
  vpc_id     = var.default_vpc_id
  cidr_block = var.dashboard_service_1_private_subnet_cidr_block
  availability_zone = var.dashboard_service_1_private_subnet_az
  
  tags = {
    Name = "dashboard_service_1_private_subnet"
  }
}

resource "aws_security_group" "dashboard_sg_1" {
  name        = "dashboard_sg_1"
  vpc_id      = var.default_vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.jump_host_public_subnet_cidr_block]
  }

  
   ingress {
    description     = "From ALB on service ports"
    from_port       = 8000
    to_port       = 8000
    protocol        = "tcp"
    security_groups = [aws_security_group.dashboard_alb_sg.id]
  }

#forgot to add 
  egress {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  security_groups = [aws_security_group.counting_alb_sg.id]
}

  tags = {
    Name = "dashboard_security_group_1"
  }
}


resource "aws_route_table_association" "dashboard_service_1_route_table_association" {
  subnet_id      = aws_subnet.dashboard_service_1_private_subnet.id
  route_table_id = var.default_private_subnet_route_table_id
}
