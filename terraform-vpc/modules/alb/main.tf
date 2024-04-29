#ALb module
resource "aws_lb" "myalb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sgs]
  subnets            = var.subnets

  enable_deletion_protection = true

  tags = {
    name = "test-lb-tf"
  }

}

#Listener

resource "aws_lb_listener" "mylistner" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

#targetgroup

resource "aws_lb_target_group" "tg" {
  name        = "tg"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = var.vpc_alb
}


#targetgroup_attachment

resource "aws_lb_target_group_attachment" "tga" {
  count = length(var.instancesalb)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instancesalb[count.index]
  port             = 80
}