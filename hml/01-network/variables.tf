variable "aws_region" {
  type = string
}

variable "cidr_block" {
  type = list(string)
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

variable "vpc_name" {
  type = string
}