resource "aws_instance" "bastion_eks"{
  ami = "ami-090006f29ecb2d79a"
  key_name = "bastion_eks"
  instance_type = "t2.micro"
  subnet_id = "subnet-03f5873486637ea01"
  vpc_security_group_ids = ["sg-02080a61df1ebea49"]

  tags = {
    Name = "bastion_eks"
  }
}