resource "aws_security_group" "counting_alb_sg" {
  name        = "counting_alb_sg"
  vpc_id      = var.default_vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.default_route]
  }

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      prefix_list_ids = []
    }

  tags = {
    Name = "counting_alb_sg"
  }
}

resource "aws_lb" "counting_alb" {
  name               = "counting-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.counting_alb_sg.id]
  subnets            = [aws_subnet.counting_service_1_private_subnet.id, aws_subnet.counting_service_2_private_subnet.id]

  tags = {
    Environment = "${var.environment}"
  }
}

resource "aws_lb_target_group" "counting_service_1_tg" {
  name     = "counting-service1-tg"
  port     = 4000
  protocol = "HTTP"
  vpc_id   = var.default_vpc_id
  
   # Define the health check block here
  health_check {
    enabled             = true
    path                = "/health"      # Your custom health check path
    protocol            = "HTTP"         # Matches your application protocol
    port                = "traffic-port" # Uses the port specified above (80)
    interval            = 30             # Time between health checks (seconds)
    timeout             = 5              # Time to wait for a response (seconds)
    healthy_threshold   = 3              # Successes to consider healthy
    unhealthy_threshold = 3              # Failures to consider unhealthy
    matcher             = "200"          # Expected HTTP status code response
  }
}

resource "aws_lb_target_group" "counting_service_2_tg" {
  name     = "counting-service2-tg"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = var.default_vpc_id
  
   # Define the health check block here
  health_check {
    enabled             = true
    path                = "/health"      # Your custom health check path
    protocol            = "HTTP"         # Matches your application protocol
    port                = "traffic-port" # Uses the port specified above (80)
    interval            = 30             # Time between health checks (seconds)
    timeout             = 5              # Time to wait for a response (seconds)
    healthy_threshold   = 3              # Successes to consider healthy
    unhealthy_threshold = 3              # Failures to consider unhealthy
    matcher             = "200"          # Expected HTTP status code response
  }
}


resource "aws_lb_target_group_attachment" "counting_service_1_tg_attachment" {
  target_group_arn = aws_lb_target_group.counting_service_1_tg.arn
  target_id        = aws_instance.counting_service_1_instance.id
  port              = 4000
}

resource "aws_lb_target_group_attachment" "counting_service_2_tg_attachment" {
  target_group_arn = aws_lb_target_group.counting_service_2_tg.arn
  target_id        = aws_instance.counting_service_2_instance.id
  port              = 5000
}

resource "aws_lb_listener" "backend_end_listener" {
  load_balancer_arn = aws_lb.counting_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.counting_service_1_tg.arn
        weight = 1
      }

      target_group {
        arn    = aws_lb_target_group.counting_service_2_tg.arn
        weight = 3
      }
    }
  }
}