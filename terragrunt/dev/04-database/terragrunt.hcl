terraform {
  source = "${find_in_parent_folders("terraform-modules")}/04-database"
}

include "common"{
  path = find_in_parent_folders("common.hcl")
}

locals{
env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  security_group = "sg_db_${local.env_vars.locals.env}"

  vpc_eks = "vpc_eks_${local.env_vars.locals.env}"

  aws_subnet = "*private*"

  name = "db_subnet_group_postgre_${local.env_vars.locals.env}"

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