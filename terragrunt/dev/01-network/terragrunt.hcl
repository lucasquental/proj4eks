terraform {
  source = "${find_in_parent_folders("terraform-modules")}/01-network"
}

include "common"{
  path = find_in_parent_folders("common.hcl")
}

inputs = {
  availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  cidr_block = "192.168.0.0/16"
  public_subnets = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  private_subnets = ["192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]
  vpc_name = "vpc_eks_dev"
}