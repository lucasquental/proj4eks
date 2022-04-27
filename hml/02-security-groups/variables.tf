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
    type = list(string)
}

variable "ingress_rules_bastion" {  
    type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
}
variable "egress_rules_bastion" {
    type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
}

variable "ingress_rules_eks" {
    type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
}

variable "sg_ingress_rules" {
    type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
}
variable "sg_egress_rules" {
    type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
}