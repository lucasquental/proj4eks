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

provider "helm"{
  kubernetes {
    config_path = "~/.kube/config"
  }
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
  vpc_id          = "vpc-08a289de2c2340166"
  subnets         = ["subnet-00c0eb4ca1be44248", "subnet-01550080c6d77c4af"]

  worker_groups = [
    {
      instance_type = "t2.micro"
      asg_max_size  = 3
    }
  ]
}

/*
resource "helm_release" "proj2k8s" {
  name       = "proj2k8s"

  repository = "./prod-0.1.0.tgz"
  chart      = "proj2k8s"

  values = [
    file("./values.yaml")
  ]
}
*/