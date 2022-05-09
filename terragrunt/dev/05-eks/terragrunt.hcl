terraform {
  source = "${find_in_parent_folders("terraform-modules")}/05-eks"
}

remote_state{
  backend "s3" {
    encrypt        = true
    bucket         = "s3-bucket-tfstate-proj42-dev"
    region         = "us-east-2"
    key            = "05-eks/terraform.tfstate"
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
  security_group_eks = "sg_eks"

  vpc_eks = "vpc_eks_dev"

  aws_subnet = "*private*"

  eks_cluster_version = "1.21"

  eks_cluster_name = "terraform_cluster_homolog"

  worker_instance = "t3.small"

  worker_asg_max = 3
}