variable "health_check_path" {
  description = "Health check path for the default target group"
  default     = "/ping/"
}

variable "vpc_id" {
  description = "ID of the VPC"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
}

variable "security_group_load_balancer_id" {
  description = "ID of the load balancer security group"
}

variable "public_subnet_1_id" {
  description = "ID of the public subnet 1"
}

variable "environment" {
  description = "The environment to create resources in."
}

variable "public_subnet_2_id" {
  description = "ID of the public subnet 2"
}