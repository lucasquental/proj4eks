provider "aws" {
  region = "sa-east-1"
}

resource "aws_s3_bucket" "s3_bucket_tfstate" {
    bucket = "s3_bucket_tfstate"
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      prevent_destroy = true
    }
 
    tags {
      Name = "S3 Remote Terraform State Store"
    }      
}