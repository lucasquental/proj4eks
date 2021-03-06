data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

terraform {
  required_version = ">= 0.14.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.3"
    }
  }
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_eks]
  }
}

data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.security_group_eks]
  }
}

data "aws_subnets" "private" {

  filter {
    name   = "tag:Name"
    values = [var.aws_subnet]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_version = var.eks_cluster_version
  cluster_name    = var.eks_cluster_name
  vpc_id          = data.aws_vpc.selected.id
  subnets         = data.aws_subnets.private.ids

  worker_groups = [
    {
      instance_type = var.worker_instance
      asg_max_size  = var.worker_asg_max
    }
  ]
  map_users = [{
    userarn = "arn:aws:iam::168112612783:user/jp.matheus"
    username = "jp.matheus"
    groups = ["system:masters"]
  }]

}