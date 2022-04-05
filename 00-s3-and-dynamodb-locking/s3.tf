provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

resource "aws_s3_bucket" "s3_bucket_tfstate" {
  bucket = "s3-bucket-tfstate-proj42"

  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}