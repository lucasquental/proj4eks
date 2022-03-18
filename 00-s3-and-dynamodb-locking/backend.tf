terraform {
 backend "s3" {
 encrypt = true
 path = "00-s3-and-dynamodb-locking/"
 bucket = "s3-bucket-tfstate-proj4"
 region = "sa-east-1"
 key = "terraform.tfstate"
 dynamodb_table = "s3_state_lock"
 }
}