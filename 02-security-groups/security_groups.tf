resource "aws_security_group" "sg_bastion"{
  name = "sg_bastion"
  description = "sg_bastion"
  vpc_id = "vpc-0c93a2c7211607c96"

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
  description = "sg_eks"
  vpc_id = "vpc-0c93a2c7211607c96"

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