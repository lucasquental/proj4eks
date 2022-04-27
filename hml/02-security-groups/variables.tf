variable "aws_region" {
    type = string
}

variable "vpc_aws" {
    type = string
}

variable "tag_name_bastion" {
    type = string
}
variable "tag_name_eks" {
    type = string
}
variable "tag_name_db" {
    type = string
}

variable "description_bastion" {
    type = string
}
variable "description_eks" {
    type = string
}
variable "description_db" {
    type = string
}

variable "cidr_block" {
    type = string
}

variable "ingress_rules_bastion" {
    type = string
}
variable "egress_rules_bastion" {
    type = string
}

variable "ingress_rules_eks" {
    type = string
}

variable "sg_ingress_rules" {
    type = string
}
variable "sg_egress_rules" {
    type = string
}