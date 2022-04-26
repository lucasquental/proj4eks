aws_region = "us-east-2"

vpc_aws = "vpc_eks"

cidr_block = "0.0.0.0/0"

port = "0"

port_ssh = "22"

port_db = "5432"

sg_ingress_rules = [{
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_block = "0.0.0.0/0"
  description = "acesso de manutencao"
  },

  { from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_block = "0.0.0.0/0"
    description = "acesso de manutencao"
  },

  { from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block = "0.0.0.0/0"
    description = "acesso de manutencao"
  }
]

sg_egress_rules = [{
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_block = "0.0.0.0/0"
  description = "acesso de manutencao"
  },

  {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_block = "0.0.0.0/0"
    description = "acesso de manutencao"
  }
]
