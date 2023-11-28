environment        = "dev"
region             = "eu-central-1"
availability_zones = ["eu-central-1b", "eu-central-1c"]
ssh_pubkey_file    = "~/.ssh/id_rsa.pub"

ecs_autoscale_min     = 1
ecs_autoscale_max     = 5
ecs_autoscale_desired = 1
ecs_asg_amis = {
  eu-central-1 = "ami-0e8f608c9cca68ab3"
}
ecs_asg_instance_type           = "t3.micro"
ecs_app_count                   = 1
ecs_asg_docker_image_url_django = "986229010255.dkr.ecr.eu-central-1.amazonaws.com/arrivals-be:latest"

rds_instance_class = "db.t3.micro"