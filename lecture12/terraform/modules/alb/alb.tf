variable "public_subnet_a"{
}

variable "public_subnet_c"{
}

variable "vpc_id" {
}

variable "ec2_id"{
}

# ALB
resource "aws_lb" "alb" {
  name               = "alb-lecture12"
  load_balancer_type = "application"
  internal           = false
  idle_timeout       = 60
  subnets = [
    var.public_subnet_a,
    var.public_subnet_c
  ]
  security_groups = [aws_security_group.alb_sg.id]
}

# ターゲットグループ
resource "aws_lb_target_group" "alb_tg" {
  name     = "alb-tg-lecture12"
  vpc_id   = var.vpc_id
  port     = "80"
  protocol = "HTTP"
  health_check {
    path = "/api"
  }
}

# リスナー
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

# リスナールール
resource "aws_lb_listener_rule" "alb_listener_rule" {
  listener_arn = aws_lb_listener.alb_listener.arn
  priority     = 99
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}

resource "aws_lb_target_group_attachment" "alb_target_group_attaches" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = var.ec2_id
  port             = 80
}

resource "aws_security_group" "alb_sg" {
  name   = "alb-sg"
  vpc_id = var.vpc_id

  tags = {
    Name = "alb-sg"
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}