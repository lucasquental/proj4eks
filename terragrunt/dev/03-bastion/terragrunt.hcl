terraform {
  source = "${find_in_parent_folders("terraform-modules")}/03-bastion"
}

remote_state{
  backend "s3" {
    encrypt        = true
    bucket         = "s3-bucket-tfstate-proj42-dev"
    region         = "us-east-2"
    key            = "03-bastion/terraform.tfstate"
    dynamodb_table = "s3_state_lock_dev"
  }
}
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-2"
}
EOF
}

inputs = {
  security_group = "sg_bastion_dev"

  aws_subnet = "vpc_eks_dev-public-us-east-2a"

  instance_type = "t3a.micro"

  key_name = "proj4-eks"

  tag_bastion = "bastion_eks_dev"

  ami_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"

  ami_virtualization-type = "hvm"

  ami_owners = "099720109477"
}