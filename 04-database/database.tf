
data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = ["sg_db"]
  }
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vpc_eks"]
  }
}

data "aws_subnets" "private" {
  
  filter {
    name = "tag:Name"
    values = ["*private*"]
  }

  filter {
    name = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  
}

resource "aws_db_subnet_group" "db_subnet_group_postgre" {
  name       = "db_subnet_group_postgre"
  subnet_ids = data.aws_subnets.private.ids

  tags = {
    Name = "Postgre-Subnet-Group"
  }
}


resource "aws_db_instance" "postgresql" {
  allocated_storage      = 5
  identifier             = "dbpostgre"
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "13.4"
  instance_class         = "db.t3.micro"
  db_name                = "dbpostgre"
  username               = "master"
  password               = "master123"
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group_postgre.name
  depends_on             = [aws_db_subnet_group.db_subnet_group_postgre]
  skip_final_snapshot    = true
}