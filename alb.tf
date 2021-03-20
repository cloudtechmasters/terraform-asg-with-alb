resource "aws_lb_target_group" "tg1" {
  name     = "example-tg1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-a9104ad1"
  target_type = "instance"

  health_check {
    interval            = 30
    path                = "/index.html"
    port                = 80
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    protocol            = "HTTP"
    matcher             = "200,202"
  }
}

resource "aws_lb" "alb-example" {
  name               = "alb-example"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.websg.id]
  subnets = ["subnet-33f82979","subnet-cb961096"]
  
  tags = {
    Environment = "alb-example"
  }
}

resource "aws_lb_listener" "listener-tg1" {
  load_balancer_arn = aws_lb.alb-example.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}
