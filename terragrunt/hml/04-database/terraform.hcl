remote_state{
  backend "s3" {
    encrypt        = true
    bucket         = "s3-bucket-tfstate-proj42-dev"
    region         = "us-east-2"
    key            = "04-database/terraform.tfstate"
    dynamodb_table = "s3_state_lock_dev"
  }
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