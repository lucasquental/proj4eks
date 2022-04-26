terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "s3-bucket-tfstate-proj42"
    region         = "us-east-2"
    key            = "04-database/terraform.tfstate"
    dynamodb_table = "s3_state_lock"
  }
}