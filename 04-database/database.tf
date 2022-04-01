resource "aws_db_subnet_group" "db_subnet_group_postgre" {
  name       = "db_subnet_group_postgre"
  subnet_ids = ["subnet-0d88b5acac8d6acc3", "subnet-0464fed6b695ca9fe"]

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
    vpc_security_group_ids = ["sg-0ebe8a304c6c5c9c5"]
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group_postgre.name
    depends_on = [aws_db_subnet_group.db_subnet_group_postgre]
    skip_final_snapshot = true
}