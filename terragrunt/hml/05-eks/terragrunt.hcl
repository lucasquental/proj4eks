terraform {
  source = "${find_in_parent_folders("terraform-modules")}/05-eks"
}

include "common"{
  path = find_in_parent_folders("common.hcl")
}

inputs = {
  security_group_eks = "sg_eks_hml"

  vpc_eks = "vpc_eks_hml"

  aws_subnet = "*private*"

  eks_cluster_version = "1.21"

  eks_cluster_name = "terraform_cluster_homolog"

  worker_instance = "t3.small"

  worker_asg_max = 3
}