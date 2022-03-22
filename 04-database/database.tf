resource "aws_db_instance" "postgresql" {
    allocated_storage = 10
    identifier = "dbpostgre"
    torage_type = "gp2"
    engine = "postgres"
    engine_version = "13.4"
    instance_class = "db.t3.micro"
    name = "postdatabase"
    username = "admin"
    password = "admin"
    vpc_security_group_ids = [ "${aws_security_group.sg_bastion.id}" ]
    db_subnet_group_name = ["${aws_subnet.priv-subnet1.id}", "${aws_subnet.priv-subnet2.id}"]
}