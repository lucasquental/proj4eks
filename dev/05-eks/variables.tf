variable "aws_region" {
    type = string
}

variable "security_group_eks" {
    type = string
}

variable "vpc_eks" {
    type = string
}

variable "aws_subnet" {
    type = string
}

variable "eks_cluster_version" {
    type = string
}

variable "eks_cluster_name" {
    type = string
}

variable "worker_instance" {
    type = string
}

variable "worker_asg_max" {
    type = string
}