terraform {
  source = "${find_in_parent_folders("terraform-modules")}/03-bastion"
}

include "common"{
  path = find_in_parent_folders("common.hcl")
}

inputs = {
  security_group = "sg_bastion_hml"
  
  aws_subnet = "vpc_eks_hml-public-us-east-2a"

  instance_type = "t3a.micro"

  key_name = "proj4-eks"

  tag_bastion = "bastion_eks_hml"

  ami_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"

  ami_virtualization-type = "hvm"

  ami_owners = "099720109477"
}