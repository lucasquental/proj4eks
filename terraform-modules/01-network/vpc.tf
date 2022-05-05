module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~>3.12.0"

  name = var.vpc_name
  cidr = var.cidr_block

  azs             = var.availability_zones
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway   = true
  enable_vpn_gateway   = false
  enable_dns_hostnames = true

  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = {
    terraform = "true"
  }
}