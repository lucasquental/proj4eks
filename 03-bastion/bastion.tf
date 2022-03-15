resource "aws_instance" "bastion_eks"{
  ami = "ami-090006f29ecb2d79a"
  key_name = "bastion_eks"
  instance_type = "t2.micro"
  subnet_id = "subnet-0684cd2dbe4fb7b79"
  vpc_security_group_ids = ["sg-08da97643021d1036"]

  tags = {
    Name = "bastion_eks"
  }
}