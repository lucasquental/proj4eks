resource "aws_db_subnet_group" "db_subnet_group_postgre" {
  name       = "db_subnet_group_postgre"
  subnet_ids = ["subnet-058f13a060a7fa00c","subnet-06d4a4e1436c4ed72"]
  description = "rds subnet groups"

  tags = {
    Name = "Postgre-Subnet-Group"
  }
}


resource "aws_db_instance" "postgresql" {
    allocated_storage = 5
    identifier = "postgresql"
    storage_type = "gp2"
    engine = "postgres"
    engine_version = "13.4"
    instance_class = "db.t3.micro"
    db_name = "dbpostgre"
    username = "master"
    password = "master123"
    vpc_security_group_ids = ["sg-0b94e171684c96606"]
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group_postgre.name
    depends_on = [aws_db_subnet_group.db_subnet_group_postgre]
    skip_final_snapshot = true
}