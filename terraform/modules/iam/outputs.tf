output "iam_instance_profile" {
  value = aws_iam_instance_profile.ecs.name
}

output "role_ecs_service_role_arn" {
  value = aws_iam_role.ecs-service-role.arn
}
