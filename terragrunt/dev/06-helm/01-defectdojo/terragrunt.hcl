terraform {
  source = "${find_in_parent_folders("terraform-modules")}/06-helm/01-defectdojo"
}

remote_state{
  backend "s3" {
    encrypt        = true
    bucket         = "s3-bucket-tfstate-proj42-dev"
    region         = "us-east-2"
    key            = "06-helm-defectdojo/terraform.tfstate"
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
  helm_name_defectdojo = "defectdojo"

  helm_namespace_defectdojo = "ddojo"

  helm_repository_defectdojo = "./"

  helm_chart_defectdojo = "defectdojo"

  helm_values_defectdojo = "./defectdojo/values.yaml"
}