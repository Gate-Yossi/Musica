resource "aws_lb" "learn_lb" {
  name               = var.tag_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.sg_id}"]
  subnets            = ["${var.public_a_id}", "${var.public_c_id}"]
}

resource "aws_lb_listener" "learn_lb_listener" {
  load_balancer_arn = aws_lb.learn_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.learn_lb_target_group.arn
  }
}

resource "aws_lb_target_group" "learn_lb_target_group" {
  name        = var.tag_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${var.vpc_id}"
  target_type = "ip"
}
