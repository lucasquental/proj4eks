terraform {
  source = "${find_in_parent_folders("terraform-modules")}/00-s3-and-dynamodb-locking"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-2"
}
EOF
}

inputs = {
  dynamodb_name = "s3_state_lock_dev"

  profile = "default"

  bucket = "s3-bucket-tfstate-proj42-dev"

  bucket_tag_name = "S3 Remote Terraform State Store Dev"
}