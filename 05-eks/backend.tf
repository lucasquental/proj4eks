terraform {
 backend "s3" {
 encrypt = true
 bucket = "s3-bucket-tfstate-proj4"
 region = "sa-east-1"
 key = "05-eks/terraform.tfstate"
 dynamodb_table = "s3_state_lock"
 }
}