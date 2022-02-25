provider "aws"{
    region = "sa-east-1"
}

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

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version = "17.24.0"
  cluster_version = "1.21"
  cluster_name    = "terraform_cluster_homolog"
  vpc_id          = "vpc-0b5e81b583f8bd4c9"
  subnets         = ["subnet-0a73bd42e54875e57", "subnet-0f335398854b0e0d2"]

  worker_groups = [
    {
      instance_type = "t3.medium"
      asg_max_size  = 3
    }
  ]
}