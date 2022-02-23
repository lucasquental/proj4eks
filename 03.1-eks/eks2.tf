provider "aws"{
  region = "sa-east-1"
}

module "eks"{
  source = "terraform-aws-modules/eks/aws"

  cluster_name                    = "my-cluster"
  cluster_version                 = "1.21"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  vpc_id     = "vpc-01d880db64279173b"
  subnet_ids = ["subnet-006bc6a23c1e3385e", "subnet-09348b323b04b8498"]

 
  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    disk_size              = 10
    instance_types         = ["t2.micro"]
    vpc_security_group_ids = ["sg-0680e266a35656354"]
  }

  eks_managed_node_groups = {
    worker_ec2 = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t2.micro"]
      capacity_type  = "SPOT"
    }
  }
}
