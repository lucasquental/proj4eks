terraform {
  source = "${find_in_parent_folders("terraform-modules")}/04-database"
}

remote_state{
  backend "s3" {
    encrypt        = true
    bucket         = "s3-bucket-tfstate-proj42-dev"
    region         = "us-east-2"
    key            = "04-database/terraform.tfstate"
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
  security_group = "sg_db_dev"

  vpc_eks = "vpc_eks_dev"

  aws_subnet = "*private*"

  name = "db_subnet_group_postgre_dev"

  allocated_storage = 5

  identifier = "dbpostgre"

  storage_type = "gp2"

  engine = "postgres"

  engine_version = "13.4"

  instance_class = "db.t3.micro"

  db_name = "dbpostgre"

  username = "master"

  password = "master123"

  tag_name = "Postgre-Subnet-Group"
}