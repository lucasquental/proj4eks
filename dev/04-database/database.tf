
data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.security_group]
  }
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_eks]
  }
}

data "aws_subnets" "private" {
  
  filter {
    name = "tag:Name"
    values = [var.aws_subnet]
  }

  filter {
    name = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  
}

resource "aws_db_subnet_group" "db_subnet_group_postgre" {
  name       = var.name
  subnet_ids = data.aws_subnets.private.ids

  tags = {
    Name = "Postgre-Subnet-Group"
  }
}


resource "aws_db_instance" "postgresql" {
  allocated_storage      = 5
  identifier             = var.identifier
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group_postgre.name
  depends_on             = [aws_db_subnet_group.db_subnet_group_postgre]
  skip_final_snapshot    = true
}