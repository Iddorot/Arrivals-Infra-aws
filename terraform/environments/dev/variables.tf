variable "region" {
  description = "The AWS region to create resources in."
}

variable "environment" {
  description = "The environment to create resources in."
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}

variable "ssh_pubkey_file" {
  description = "Path to an SSH public key"
}

variable "ecs_autoscale_min" {
  description = "Minimum autoscale (number of EC2)"
}
variable "ecs_autoscale_max" {
  description = "Maximum autoscale (number of EC2)"
}
variable "ecs_autoscale_desired" {
  description = "Desired autoscale (number of EC2)"
}

variable "ecs_asg_amis" {
  description = "Which AMI to spawn."
}
variable "ecs_asg_instance_type" {
  description = "EC2 instance type"
}
variable "ecs_asg_docker_image_url_django" {
  description = "Docker image to run in the ECS cluster"
}
variable "ecs_app_count" {
  description = "Number of Docker containers to run"
}

variable "rds_instance_class" {
  description = "RDS instance type"
}

variable "rds_password" {
  sensitive   = true
  description = "RDS database password"
}