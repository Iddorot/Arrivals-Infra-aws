output "security_group_load_balancer_id" {
  value = aws_security_group.load-balancer.id
}

output "security_group_ecs_id" {
  value = aws_security_group.ecs.id
}

output "rds_security_group_id" {
  value = aws_security_group.rds.id
}
