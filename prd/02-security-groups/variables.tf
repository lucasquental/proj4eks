variable "aws_region" {
  type        = string
  description = ""
}

variable "vpc_aws" {
  type        = string
  description = ""
}

variable "cidr_block" {
  type        = string
  description = ""
}

variable "port" {
  type        = string
  description = ""
}

variable "port_ssh" {
  type        = string
  description = ""
}

variable "port_db" {
  type        = string
  description = ""
}

variable "sg_ingress_rules" {}

variable "sg_egress_rules" {}

variable "bucket" {}

variable "bucket_key" {}

variable "dynamodb_table" {}