aws_region = "us-east-2"

security_group = "sg_db"

vpc_eks = "vpc_eks"

aws_subnet = "*private*"

name = "db_subnet_group_postgre"

identifier = "dbpostgre"

storage_type = "gp2"

engine = "postgres"

engine_version = "13.4"

instance_class = "db.t3.micro"

db_name = "dbpostgre"

username = "master"

password = "master123"
