provider "aws" {
  region = "us-east-2"
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vpc_eks"]
  }
}

resource "aws_security_group" "sg_bastion" {
  name        = "sg_bastion"
  description = "security group for Bastion"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "ssh_port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "ssh_port"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_bastion"
  }
}

resource "aws_security_group" "sg_eks" {
  name        = "sg_eks"
  description = "security group for EKS"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description     = "ssh_port"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["${aws_security_group.sg_bastion.id}"]
  }
  depends_on = [aws_security_group.sg_bastion]
  tags = {
    Name = "sg_eks"
  }
}

resource "aws_security_group" "sg_db" {
  name        = "sg_db"
  description = "security group for database"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description     = "ssh_port"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["${aws_security_group.sg_bastion.id}"]
  }

  ingress {
    description     = "db_port"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = ["${aws_security_group.sg_bastion.id}"]
  }

  depends_on = [aws_security_group.sg_bastion]
  tags = {
    Name = "sg_db"
  }
}