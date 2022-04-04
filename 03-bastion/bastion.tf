provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "bastion_eks"{
  ami = "ami-0fb653ca2d3203ac1"
  key_name = "bastion_eks"
  instance_type = "t2.micro"
  subnet_id = "subnet-058f13a060a7fa00c"
  vpc_security_group_ids = ["sg-0bc27556232595f10"]

  tags = {
    Name = "bastion_eks"
  }
}