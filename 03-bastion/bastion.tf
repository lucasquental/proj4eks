provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "bastion_eks"{
  ami = "ami-0fb653ca2d320ac1"
  key_name = "bastion_eks"
  instance_type = "t2.micro"
  subnet_id = "subnet-0e1ddd70d6d050766"
  vpc_security_group_ids = ["sg-09fdeca5b3cdd5c6d"]

  tags = {
    Name = "bastion_eks"
  }
}