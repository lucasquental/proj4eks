provider "aws" {
  region = "sa-east-1"
}

resource "aws_s3_bucket" "s3_bucket_tfstate" {
    bucket = "s3-bucket-tfstate-proj4"
 
    tags = {
      Name = "S3 Remote Terraform State Store"
    }  
}