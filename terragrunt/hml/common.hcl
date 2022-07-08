remote_state{
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    encrypt        = true
    bucket         = "s3-bucket-tfstate-proj42-hml"
    region         = "us-east-2"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "s3_state_lock_hml"
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