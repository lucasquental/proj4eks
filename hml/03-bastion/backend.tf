terraform {
  backend "s3" {
    encrypt        = true
    bucket         = var.bucket
    region         = var.aws_region
    key            = var.bucket_key
    dynamodb_table = var.dynamodb_table
  }
}