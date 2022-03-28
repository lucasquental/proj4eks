provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "bastion_eks"{
  ami = "ami-090006f29ecb2d79a"
  key_name = "bastion_eks"
  instance_type = "t2.micro"
  subnet_id = "subnet-0bbb86e0af8d3045e"
  vpc_security_group_ids = ["sg-07fca36ce3827ce12"]

  tags = {
    Name = "bastion_eks"
  }
}