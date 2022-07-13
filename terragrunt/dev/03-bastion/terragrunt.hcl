terraform {
  source = "${find_in_parent_folders("terraform-modules")}/03-bastion"
}

include "common"{
  path = find_in_parent_folders("common.hcl")
}

locals{
env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  security_group = "sg_bastion_${local.env_vars.locals.env}"

  aws_subnet = "vpc_eks_${local.env_vars.locals.env}-public-us-east-2a"

  instance_type = "t3a.micro"

  key_name = "proj4-eks"

  tag_bastion = "bastion_eks_${local.env_vars.locals.env}"

  ami_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"

  ami_virtualization-type = "hvm"
  
  ami_owners = "099720109477"
}