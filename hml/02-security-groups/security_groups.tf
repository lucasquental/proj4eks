provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_aws]
  }
}

resource "aws_security_group" "sg_bastion" {
  name        = "sg_bastion"
  description = "security group for Bastion"
  vpc_id      = data.aws_vpc.selected.id
  tags = {
    Name = "sg_bastion"
  }
}

resource "aws_security_group_rule" "ingress_rules_bastion" {
  type              = "ingress"
  from_port         = var.port_ssh
  to_port           = var.port_ssh
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_block]
  security_group_id = aws_security_group.sg_bastion.id
}

resource "aws_security_group_rule" "egress_rules_bastion" {
  type              = "egress"
  from_port         = var.port
  to_port           = var.port
  protocol          = "-1"
  cidr_blocks       = [var.cidr_block]
  security_group_id = aws_security_group.sg_bastion.id
}


resource "aws_security_group" "sg_eks" {
  name        = "sg_eks"
  description = "security group for EKS"
  vpc_id      = data.aws_vpc.selected.id
  depends_on  = [aws_security_group.sg_bastion]
  tags = {
    Name = "sg_eks"
  }
}

resource "aws_security_group_rule" "ingress_rules_eks" {
  type              = "ingress"
  from_port         = var.port_ssh
  to_port           = var.port_ssh
  protocol          = "tcp"
  cidr_blocks = [var.cidr_block]
  security_group_id = aws_security_group.sg_eks.id
}

resource "aws_security_group" "sg_db" {
  name        = "sg_db"
  description = "security group for database"
  vpc_id      = data.aws_vpc.selected.id
  depends_on  = [aws_security_group.sg_bastion]
  tags = {
    Name = "sg_db"
  }
}

resource "aws_security_group_rule" "ingress_rules_db" {
  for_each          = { for index, rules in var.sg_ingress_rules : index => rules }
  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = [each.value.cidr_block]
  description       = each.value.description
  security_group_id = aws_security_group.sg_db.id
}

resource "aws_security_group_rule" "egress_rules_db" {
  for_each          = { for index, rules in var.sg_egress_rules : index => rules }
  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = [each.value.cidr_block]
  description       = each.value.description
  security_group_id = aws_security_group.sg_db.id
}