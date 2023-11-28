<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

### Add your AWS credentials along with the default region:
```
$ export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
$ export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"
$ export AWS_DEFAULT_REGION="eu-central-1"

``
## build and push docker to ecr:
```
docker build -f Dockerfile.prod -t 986229010255.dkr.ecr.eu-central-1.amazonaws.com/arrivals-be:latest . 

docker push 986229010255.dkr.ecr.eu-central-1.amazonaws.com/arrivals-be:latest
```

## update deployment:
```
python deploy/update-ecs.py --cluster=dev-cluster --service=dev-service-backend

```
## Update inframap
```
aws s3 cp s3://dev-arrivals-s3-tfstate/terraform.tfstate - | inframap generate --tfstate | dot -Tpng > inframap.png
```
## Infra Cost
```
infracost breakdown --path . --terraform-var-file dev.tfvars --format json --out-file infracost-base.json
```
