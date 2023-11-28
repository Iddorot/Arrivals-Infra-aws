resource "aws_key_pair" "keypair" {
  key_name   = "${var.environment}-cluster-key-pair"
  public_key = file(var.ssh_pubkey_file)
}

resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.environment}-cluster"
  tags = {
    Environment = var.environment
    Name        = "${var.environment}-cluster"
  }
}

resource "aws_launch_template" "as_temp" {
  name          = "${var.environment}-as-temp"
  image_id      = lookup(var.amis, var.region)
  instance_type = var.instance_type
  key_name      = aws_key_pair.keypair.key_name
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group_ecs_id]
  }
  iam_instance_profile {
    name = var.iam_instance_profile
  }
  user_data = base64encode("#!/bin/bash\necho ECS_CLUSTER='${var.environment}-cluster' > /etc/ecs/ecs.config")
}

data "template_file" "backend" {
  template = file("${path.module}/templates/backend.json.tpl")

  vars = {
    docker_image_url_django = var.docker_image_url_django
    region                  = var.region
    environment             = var.environment
    rds_db_name             = var.rds_db_name
    rds_username            = var.rds_username
    rds_password            = var.rds_password
    rds_hostname            = var.rds_hostname

  }
}

resource "aws_ecs_task_definition" "backend" {
  family                = "backend"
  container_definitions = data.template_file.backend.rendered
}

resource "aws_ecs_service" "backend" {
  name            = "${var.environment}-service-backend"
  cluster         = aws_ecs_cluster.ecs-cluster.id
  task_definition = aws_ecs_task_definition.backend.arn
  iam_role        = var.role_ecs_service_role_arn
  desired_count   = var.app_count
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = var.aws_alb_target_group_arn
    container_name   = "backend"
    container_port   = 8000
  }
  tags = {
    Environment = var.environment
    Name        = "${var.environment}-service-backend"
  }
  lifecycle {
    ignore_changes = [
      task_definition
    ]
  }
}

resource "aws_autoscaling_group" "ecs-cluster" {
  name              = "${aws_ecs_cluster.ecs-cluster.name}-as-group"
  min_size          = var.autoscale_min
  max_size          = var.autoscale_max
  desired_capacity  = var.autoscale_desired
  health_check_type = "EC2"
  launch_template {
    id      = aws_launch_template.as_temp.id
    version = "$Latest"
  }
  vpc_zone_identifier = [var.private_subnet_1_id, var.private_subnet_2_id]
}
