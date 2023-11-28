resource "aws_s3_bucket" "tfstate" {
  bucket = "${var.environment}-arrivals-s3-tfstate"
  tags = {
    Name        = "${var.environment}-s3-tfstate"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "versioning_tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}