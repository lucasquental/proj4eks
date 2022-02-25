resource "aws_security_group" "sg_bastion"{
  name = "sg_bastion"
  description = "sg_bastion"
  vpc_id = "vpc-0b5e81b583f8bd4c9"

  ingress {
    description      = "sg_bastion"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["189.79.110.66/32"]
  }
  tags = {
  Name = "sg_bastion"
  }
}

resource "aws_security_group" "sg_eks"{
  name = "sg_eks"
  description = "sg_eks"
  vpc_id = "vpc-08a289de2c2340166"

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