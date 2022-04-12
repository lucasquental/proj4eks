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

provider "aws" {
  region = "us-east-2"
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
    values = ["vpc_eks"]
  }
}

data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = ["sg_eks"]
  }
}

data "aws_subnets" "private" {

  filter {
    name   = "tag:Name"
    values = ["*private*"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_version = "1.21"
  cluster_name    = "terraform_cluster_homolog"
  vpc_id          = data.aws_vpc.selected.id
  subnets         = data.aws_subnets.private.ids

  worker_groups = [
    {
      instance_type = "t3.small"
      asg_max_size  = 3
      vpc_security_group_ids = [data.aws_security_group.selected.id]
    }
  ]
  map_users = [{
    userarn = "arn:aws:iam::168112612783:user/lucas.quental"
    username = "lucas.quental"
    groups = ["system:masters"]
  }]

}