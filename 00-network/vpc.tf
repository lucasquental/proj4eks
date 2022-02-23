provider "aws" {
  region = "sa-east-1"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~>3.12.0"

  name = "vpc_eks"
  cidr = "10.0.0.0/16"

  azs = ["sa-east-1a", "sa-east-1c"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false
  enable_dns_hostnames = true
  
  single_nat_gateway = false

  tags = {
    terraform = "true"
  }
}