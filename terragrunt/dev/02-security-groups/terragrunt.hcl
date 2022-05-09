terraform {
  source = "${find_in_parent_folders("terraform-modules")}/02-security-groups"
}

remote_state{
  backend "s3" {
    encrypt        = true
    bucket         = "s3-bucket-tfstate-proj42-dev"
    region         = "us-east-2"
    key            = "02-security-groups/terraform.tfstate"
    dynamodb_table = "s3_state_lock_dev"
  }
}
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-2"
}
EOF
}

inputs = {
  vpc_aws = "vpc_eks_dev"
  
  tag_name_bastion = "sg_bastion_dev"
  tag_name_db      = "sg_db_dev"
  tag_name_eks     = "sg_eks_dev"

  description_bastion = "security group for Bastion"
  description_db      = "security group for database"
  description_eks     = "security group for EKS"

  cidr_block = "0.0.0.0/0"

  ingress_rules_bastion = [{
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
    description = "acesso de manutencao"
    }
  ]

  egress_rules_bastion = [{
    type        = "egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
    description = "acesso de manutencao"
    }
  ]

  ingress_rules_eks = [{
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
    description = "acesso de manutencao"
    }
  ]


  sg_ingress_rules = [{
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
    description = "acesso de manutencao"
    },
    {
      type        = "ingress"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_block  = "0.0.0.0/0"
      description = "acesso de manutencao"
    },

    {
      type        = "ingress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
      description = "acesso de manutencao"
    }
  ]

  sg_egress_rules = [{
    type        = "egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
    description = "acesso de manutencao"
    },

    {
      type        = "egress"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_block  = "0.0.0.0/0"
      description = "acesso de manutencao"
    }
  ]
}