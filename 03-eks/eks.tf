module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.7.2"

  cluster_name                    = "terraform_cluster"
  cluster_version                 = "1.21"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = "vpc-0b5e81b583f8bd4c9"
  subnet_ids = ["subnet-0a73bd42e54875e57","subnet-0f335398854b0e0d2"]

  tags ={
    name = "terraform_cluster"
  }

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    disk_size              = 10
    instance_types         = ["t2.micro"]
  }

  eks_managed_node_groups = {
    worker = {
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}