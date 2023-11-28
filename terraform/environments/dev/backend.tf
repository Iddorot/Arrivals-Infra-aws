terraform {
  backend "s3" {
    bucket = "dev-arrivals-s3-tfstate"
    region = "eu-central-1"
    key    = "terraform.tfstate"
  }
}
