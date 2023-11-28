variable "ssh_pubkey_file" {
  description = "Path to an SSH public key"
}

variable "environment" {
  description = "The environment to create resources in."
}

variable "region" {
  description = "AWS region to create resources in."
}

variable "amis" {
  description = "Which AMI to spawn."
}
variable "instance_type" {
  description = "EC2 instance type"
}
variable "docker_image_url_django" {
  description = "Docker image to run in the ECS cluster"
}
variable "app_count" {
  description = "Number of Docker containers to run"
}

variable "security_group_ecs_id" {
  description = "The ID of the security group for the ECS cluster."
}
variable "iam_instance_profile" {
  description = "value of iam_instance_profile"
}
variable "role_ecs_service_role_arn" {
  description = "value of role_ecs_service_role_arn"
}
variable "aws_alb_target_group_arn" {
  description = "value of aws_alb_target_group_arn"
}

variable "autoscale_min" {
  description = "Minimum autoscale (number of EC2)"
}
variable "autoscale_max" {
  description = "Maximum autoscale (number of EC2)"
}
variable "autoscale_desired" {
  description = "Desired autoscale (number of EC2)"
}
variable "private_subnet_1_id" {
  description = "value of private_subnet_1_id"
}
variable "private_subnet_2_id" {
  description = "value of private_subnet_2_id"
}

variable "rds_db_name" {
  description = "value of rds_db_name"
}
variable "rds_username" {
  description = "RDS database username"
}

variable "rds_password" {
  description = "RDS database password"
}

variable "rds_hostname" {
  description = "RDS database hostname"
}