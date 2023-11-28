# Backend CloudWatch log group
resource "aws_cloudwatch_log_group" "backend-log-group" {
  name              = "/ecs/backend-${var.environment}"
  retention_in_days = var.log_retention_in_days
  tags = {
    Name        = "/ecs/backend-${var.environment}"
    Environment = var.environment
  }
}

# Backend CloudWatch log stream
resource "aws_cloudwatch_log_stream" "backend-log-stream" {
  name           = "${var.environment}-backend-log-stream"
  log_group_name = aws_cloudwatch_log_group.backend-log-group.name
}
