terraform {
 backend "s3" {
 encrypt = true
 bucket = "s3-bucket-tfstate-proj4"
 region = "sa-east-1"
 key = "terraform.tfstatevpc"
 }
}