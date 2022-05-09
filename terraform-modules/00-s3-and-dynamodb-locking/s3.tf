resource "aws_s3_bucket" "s3_bucket_tfstate" {
  bucket = var.bucket

  tags = {
    Name = var.bucket_tag_name
  }
}