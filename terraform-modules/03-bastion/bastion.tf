data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = [var.ami_virtualization-type]
  }

  owners = [var.ami_owners]
}

data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.security_group]
  }
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.aws_subnet]
  }
}


resource "aws_instance" "bastion_eks" {
  ami                    = data.aws_ami.ubuntu.id
  key_name               = var.key_name
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.selected.id
  vpc_security_group_ids = [data.aws_security_group.selected.id]

  tags = {
    Name = var.tag_bastion
  }
}