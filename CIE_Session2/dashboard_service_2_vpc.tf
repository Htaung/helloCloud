resource "aws_subnet" "dashboard_service_2_private_subnet" {
  vpc_id     = var.default_vpc_id
  cidr_block = var.dashboard_service_2_private_subnet_cidr_block
  availability_zone = var.dashboard_service_2_private_subnet_az
  
  tags = {
    Name = "dashboard_service_2_private_subnet"
  }
}

resource "aws_security_group" "dashboard_sg_2" {
  name        = "dashboard_sg_2"
  vpc_id      = var.default_vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.jump_host_public_subnet_cidr_block]
  }

   ingress {
    description     = "From ALB on service ports"
    from_port       = 9000
    to_port         = 9000
    protocol        = "tcp"
    security_groups = [aws_security_group.dashboard_alb_sg.id]
  }

  tags = {
    Name = "dashboard_security_group_2"
  }
}

resource "aws_route_table_association" "dashboard_service_2_route_table_association" {
  subnet_id      = aws_subnet.dashboard_service_2_private_subnet.id
  route_table_id = var.default_private_subnet_route_table_id
}