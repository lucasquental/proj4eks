locals{
env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

remote_state{
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    encrypt        = true
    bucket         = "s3-bucket-tfstate-proj42-${local.env_vars.locals.env}"
    region         = "us-east-2"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "s3_state_lock_${local.env_vars.locals.env}"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-2"
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
EOF
}