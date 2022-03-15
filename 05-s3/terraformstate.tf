terraform {
 backend "s3" {
 encrypt = true
 bucket = "s3_bucket_tfstate"
 region = sa-east-1
 key = path/to/state/file
 }
}