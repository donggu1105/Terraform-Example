#resource "aws_alb" "dev-backend-open-api-alb" {
#    idle_timeout    = 60
#    internal        = false
#    name            = "${local.prefix}-alb"
#    security_groups = [data.aws_security_group.alb-sg.id]
#    subnets         = data.aws_subnet_ids.public.ids
#
#    enable_deletion_protection = false
#
#    tags = {
#        Name = "${local.prefix}-alb"
#    }
#}
#
#resource "aws_alb_target_group" "dev-backend-open-api-tg" {
#  name     = "${local.prefix}-tg"
#  port     = 8080
#  protocol = "HTTP"
#  target_type = "ip"
#  vpc_id   = data.aws_vpc.vpc.id
#
#  health_check {
#    protocol = "HTTP"
#    interval            = 300
#    path                = "/ping"
#    healthy_threshold   = 3
#    unhealthy_threshold = 3
#  }
#
#  tags = { Name = "${local.prefix} Target Group" }
#}
#
#data "aws_acm_certificate" "onesell_co_kr"   {
#  domain   = "*.onesell.co.kr"
#  statuses = ["ISSUED"]
#}
#
#resource "aws_alb_listener" "https" {
#  load_balancer_arn = aws_alb.dev-backend-open-api-alb.arn
#  port              = "443"
#  protocol          = "HTTPS"
#  ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = data.aws_acm_certificate.onesell_co_kr.arn
#
#  default_action {
#    target_group_arn = aws_alb_target_group.dev-backend-open-api-tg.arn
#    type             = "forward"
#  }
#}
#
#resource "aws_alb_listener" "http" {
#  load_balancer_arn = aws_alb.dev-backend-open-api-alb.arn
#  port              = "80"
#  protocol          = "HTTP"
#
#  default_action {
#    target_group_arn = aws_alb_target_group.dev-backend-open-api-tg.arn
#    type             = "forward"
#  }
#}
