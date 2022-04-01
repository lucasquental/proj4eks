resource "aws_db_subnet_group" "db_subnet_group_postgre" {
  name       = "db_subnet_group_postgre"
  subnet_ids = ["subnet-0e1ddd70d6d050766", "subnet-0bd94bbc91c00da8c"]

  tags = {
    Name = "Postgre-Subnet-Group"
  }
}


resource "aws_db_instance" "postgresql" {
    allocated_storage = 5
    identifier = "dbpostgre"
    storage_type = "gp2"
    engine = "postgres"
    engine_version = "13.4"
    instance_class = "db.t3.micro"
    db_name = "dbpostgre"
    username = "master"
    password = "master123"
    vpc_security_group_ids = ["sg-0d4d41ae80b00eda8"]
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group_postgre.name
    depends_on = [aws_db_subnet_group.db_subnet_group_postgre]
    skip_final_snapshot = true
}