output "aws_alb_target_group_arn" {
  value = aws_alb_target_group.default-target-group.arn
}
output "alb_hostname" {
  value = aws_lb.load-balancer.dns_name
}