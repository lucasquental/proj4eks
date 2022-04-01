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

provider "aws"{
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

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_version = "1.21"
  cluster_name    = "terraform_cluster_homolog"
  vpc_id          = "vpc-0ea5b2d621d5d7ca8"
  subnets         = ["subnet-0e1ddd70d6d050766", "subnet-0bd94bbc91c00da8c"]

  worker_groups = [
    {
      instance_type  = "t3.small"
      asg_max_size  = 3
    }
  ]
}