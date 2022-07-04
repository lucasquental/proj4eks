terraform {
  source = "${find_in_parent_folders("terraform-modules")}/04-database"
}

include "common"{
  path = find_in_parent_folders("common.hcl")
}

inputs = {
  security_group = "sg_db_hml"

  vpc_eks = "vpc_eks_hml"

  aws_subnet = "*private*"

  name = "db_subnet_group_postgre_hml"

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