output "rds_db_name" {
  value = aws_db_instance.postgres.db_name
}

output "rds_username" {
  value = aws_db_instance.postgres.username
}

output "rds_password" {
  value = aws_db_instance.postgres.password
}

output "rds_hostname" {
  value = aws_db_instance.postgres.address
}