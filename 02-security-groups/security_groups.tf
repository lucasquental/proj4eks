provider "aws" {
  region = "sa-east-1"
}

resource "aws_security_group" "sg_bastion"{
  name = "sg_bastion"
  description = "security group for Bastion"
  vpc_id = "vpc-02846a515d0aa98d6"

  ingress {
    description      = "sg_bastion"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "sg_bastion"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
  Name = "sg_bastion"
  }
}

resource "aws_security_group" "sg_eks"{
  name = "sg_eks"
  description = "security group for EKS"
  vpc_id = "vpc-02846a515d0aa98d6"

  ingress {
    description      = "sg_eks"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.sg_bastion.id}"]
  }
  depends_on = [aws_security_group.sg_bastion]
  tags = {
    Name = "sg_eks"
  }
}

resource "aws_security_group" "sg_db"{
  name = "sg_db"
  description = "security group for database"
  vpc_id = "vpc-02846a515d0aa98d6"

  ingress {
    description      = "sg_db"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.sg_bastion.id}"]
  }
  depends_on = [aws_security_group.sg_bastion]
  tags = {
    Name = "sg_db"
  }
}