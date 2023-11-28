module "network" {
  source             = "../../modules/network"
  region             = var.region
  availability_zones = var.availability_zones
}

module "security_groups" {
  source      = "../../modules/security_groups"
  vpc_id      = module.network.vpc_id
  environment = var.environment
}

module "load_balancer" {
  source                          = "../../modules/load_balancer"
  vpc_id                          = module.network.vpc_id
  ecs_cluster_name                = module.ecs_cluster.ecs_cluster_name
  security_group_load_balancer_id = module.security_groups.security_group_load_balancer_id
  public_subnet_1_id              = module.network.public_subnet_1_id
  public_subnet_2_id              = module.network.public_subnet_2_id
  environment                     = var.environment
}

module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
}
module "logs" {
  source      = "../../modules/logs"
  environment = var.environment
}

module "ecs_cluster" {
  depends_on                = [module.rds]
  source                    = "../../modules/ecs"
  environment               = var.environment
  region                    = var.region
  security_group_ecs_id     = module.security_groups.security_group_ecs_id
  iam_instance_profile      = module.iam.iam_instance_profile
  role_ecs_service_role_arn = module.iam.role_ecs_service_role_arn
  aws_alb_target_group_arn  = module.load_balancer.aws_alb_target_group_arn
  ssh_pubkey_file           = var.ssh_pubkey_file
  private_subnet_1_id       = module.network.private_subnet_1_id
  private_subnet_2_id       = module.network.private_subnet_2_id
  autoscale_min             = var.ecs_autoscale_min
  autoscale_max             = var.ecs_autoscale_max
  autoscale_desired         = var.ecs_autoscale_desired
  docker_image_url_django   = var.ecs_asg_docker_image_url_django
  app_count                 = var.ecs_app_count
  instance_type             = var.ecs_asg_instance_type
  amis                      = var.ecs_asg_amis
  rds_db_name               = module.rds.rds_db_name
  rds_username              = module.rds.rds_username
  rds_password              = module.rds.rds_password
  rds_hostname              = module.rds.rds_hostname
}

module "s3" {
  source      = "../../modules/s3"
  environment = var.environment
}

module "rds" {
  source                 = "../../modules/rds"
  environment            = var.environment
  db_subnet_group_name   = module.network.aws_db_subnet_group
  vpc_security_group_ids = module.security_groups.rds_security_group_id
  rds_instance_class     = var.rds_instance_class
  rds_password           = var.rds_password
}

#TODO : create a module for the Secrets Manger
#TODO : create a module for the S3 static files