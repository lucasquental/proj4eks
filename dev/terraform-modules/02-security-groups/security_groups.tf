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
  name        = var.tag_name_bastion
  description = var.description_bastion
  vpc_id      = data.aws_vpc.selected.id
  tags = {
    Name = var.tag_name_bastion
  }
}

resource "aws_security_group_rule" "ingress_rules_bastion" {
  for_each          = { for index, rules in var.ingress_rules_bastion : index => rules }
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = [each.value.cidr_block]
  description       = each.value.description
  security_group_id = aws_security_group.sg_bastion.id
}

resource "aws_security_group_rule" "egress_rules_bastion" {
  for_each          = { for index, rules in var.egress_rules_bastion : index => rules }
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = [each.value.cidr_block]
  description       = each.value.description
  security_group_id = aws_security_group.sg_bastion.id
}


resource "aws_security_group" "sg_eks" {
  name        = var.tag_name_eks
  description = var.description_eks
  vpc_id      = data.aws_vpc.selected.id
  depends_on  = [aws_security_group.sg_bastion]
  tags = {
    Name = var.tag_name_eks
  }
}

resource "aws_security_group_rule" "ingress_rules_eks" {
  for_each          = { for index, rules in var.ingress_rules_eks : index => rules }
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = [each.value.cidr_block]
  description       = each.value.description
  security_group_id = aws_security_group.sg_eks.id
}

resource "aws_security_group" "sg_db" {
  name        = var.tag_name_db
  description = var.description_db
  vpc_id      = data.aws_vpc.selected.id
  depends_on  = [aws_security_group.sg_bastion]
  tags = {
    Name = var.tag_name_db
  }
}

resource "aws_security_group_rule" "ingress_rules_db" {
  for_each          = { for index, rules in var.sg_ingress_rules : index => rules }
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = [each.value.cidr_block]
  description       = each.value.description
  security_group_id = aws_security_group.sg_db.id
}

resource "aws_security_group_rule" "egress_rules_db" {
  for_each          = { for index, rules in var.sg_egress_rules : index => rules }
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = [each.value.cidr_block]
  description       = each.value.description
  security_group_id = aws_security_group.sg_db.id
}