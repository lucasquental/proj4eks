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
    region = "sa-east-1"
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
  version = "17.24.0"
  cluster_version = "1.21"
  cluster_name    = "terraform_cluster_homolog"
  vpc_id          = "vpc-033f0b404715bffc2"
  subnets         = ["subnet-0464fed6b695ca9fe", "subnet-0d88b5acac8d6acc3"]

  worker_groups = [
    {
      instance_type  = "t3.small"
      asg_max_size  = 3
    }
  ]
}