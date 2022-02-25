resource "aws_instance" "bastion_eks"{
  ami = "ami-090006f29ecb2d79a"
  key_name = "bastion_eks"
  instance_type = "t2.micro"
  subnet_id = "subnet-00c0eb4ca1be44248"
  vpc_security_group_ids = ["sg-0a2c2950317104f6d"]

  tags = {
    Name = "bastion_eks"
  }
}