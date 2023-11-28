resource "aws_db_instance" "postgres" {
  identifier              = "${var.environment}-db"
  db_name                 = "${var.environment}db"
  username                = "${var.environment}dbuser"
  password                = var.rds_password
  port                    = "5432"
  engine                  = "postgres"
  engine_version          = "15.4"
  instance_class          = var.rds_instance_class
  allocated_storage       = "20"
  storage_encrypted       = false
  vpc_security_group_ids  = [var.vpc_security_group_ids]
  db_subnet_group_name    = var.db_subnet_group_name
  multi_az                = false
  storage_type            = "gp2"
  publicly_accessible     = false
  backup_retention_period = 7
  skip_final_snapshot     = true
  tags = {
    Environment = var.environment
    Name        = "${var.environment}Db"
  }
}