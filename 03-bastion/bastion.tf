provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "bastion_eks"{
  ami = "ami-090006f29ecb2d79a"
  key_name = "bastion_eks"
  instance_type = "t2.micro"
  subnet_id = "subnet-0464fed6b695ca9fe"
  vpc_security_group_ids = ["sg-054d5ffe977f3c035"]

  tags = {
    Name = "bastion_eks"
  }
}