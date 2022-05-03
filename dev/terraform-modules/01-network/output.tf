output "vpc-id" {
  value = module.vpc.vpc_id
}
output "vpc-private-subnets-id" {
  value = module.vpc.private_subnets
}
output "vpc-public-subnets-id" {
  value = module.vpc.public_subnets
}