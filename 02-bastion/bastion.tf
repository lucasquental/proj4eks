resource "aws_instance" "bastion_eks"{
  ami = "ami-090006f29ecb2d79a"
  key_name = "bastion_eks"
  instance_type = "t2.micro"
  subnet_id = "subnet-0cf71f221b114b4d1"
  vpc_security_group_ids = ["sg-0c5e88171589860ad"]

  tags = {
    Name = "bastion_eks"
  }
}