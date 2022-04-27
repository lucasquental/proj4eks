variable "aws_region" {}

variable "cidr_block" {}

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

variable "vpc_name" {}