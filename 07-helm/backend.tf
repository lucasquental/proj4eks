terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "s3-bucket-tfstate-proj42"
    region         = "sa-east-1"
    key            = "06-helm/terraform.tfstate"
    dynamodb_table = "s3_state_lock"
  }
}