variable "rds_password" {
  sensitive   = true
  description = "RDS database password"
}
variable "rds_instance_class" {
  description = "RDS instance type"
}

variable "db_subnet_group_name" {
  description = "value of db_subnet_group_name"
}
variable "vpc_security_group_ids" {
  description = "value of vpc_security_group_ids"
}
variable "environment" {
  description = "The environment to create resources in."
}