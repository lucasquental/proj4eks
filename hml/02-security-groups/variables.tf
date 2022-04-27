variable "aws_region" {}

variable "vpc_aws" {}

variable "tag_name_bastion" {}
variable "tag_name_eks" {}
variable "tag_name_db" {}

variable "description_bastion" {}
variable "description_eks" {}
variable "description_db" {}

variable "cidr_block" {}

variable "ingress_rules_bastion" {}
variable "egress_rules_bastion" {}

variable "ingress_rules_eks" {}

variable "sg_ingress_rules" {}
variable "sg_egress_rules" {}