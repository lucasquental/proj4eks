terraform {
  source = "${find_in_parent_folders("terraform-modules")}/05-eks"
}

include "common"{
  path = find_in_parent_folders("common.hcl")
}

locals{
env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  security_group_eks = "sg_eks_${local.env_vars.locals.env}"

  vpc_eks = "vpc_eks_${local.env_vars.locals.env}"

  aws_subnet = "*private*"

  eks_cluster_version = "1.21"

  eks_cluster_name = "terraform_cluster_homolog"

  worker_instance = "t3.small"

  worker_asg_max = 3
}