resource "aws_security_group" "dashboard_alb_sg" {
  name        = "dashboard_alb_sg"
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
    Name = "dashboard_alb_sg"
  }
}

resource "aws_lb" "dashboard_alb" {
  name               = "dashboard-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.dashboard_alb_sg.id]
  subnets            = [var.default-public-subnet-1, var.default-public-subnet-2, var.default-public-subnet-3]

  tags = {
    Environment = "${var.environment}"
  }
}

resource "aws_lb_target_group" "dashborad_service_1_tg" {
  name     = "dashborad-service1-tg"
  port     = 8000
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

resource "aws_lb_target_group" "dashborad_service_2_tg" {
  name     = "dashborad-service2-tg"
  port     = 8000
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


resource "aws_lb_target_group_attachment" "dashboard_service_1_tg_attachment" {
  target_group_arn = aws_lb_target_group.dashborad_service_1_tg.arn
  target_id        = aws_instance.dashboard_service_1_instance.id
  port              = 8000
}

resource "aws_lb_target_group_attachment" "dashboard_service_2_tg_attachment" {
  target_group_arn = aws_lb_target_group.dashborad_service_2_tg.arn
  target_id        = aws_instance.dashboard_service_2_instance.id
  port              = 9000
}

resource "aws_lb_listener" "front_end_listener" {
   load_balancer_arn = aws_lb.dashboard_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.dashborad_service_1_tg.arn
        weight = 4
      }

      target_group {
        arn    = aws_lb_target_group.dashborad_service_2_tg.arn
        weight = 1
      }
    }
  }
}