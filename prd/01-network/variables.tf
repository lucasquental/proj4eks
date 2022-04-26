variable "aws_region" {
  type        = string
  description = ""
}

variable "cidr_block" {
  type        = string
  description = ""
}

variable "availability_zones" {
  type        = list(string)
  description = ""
}

variable "public_subnets" {
  type        = list(string)
  description = ""
}

variable "private_subnets" {
  type        = list(string)
  description = ""
}

variable "bucket" {}

variable "bucket_key" {}

variable "dynamodb_table" {}