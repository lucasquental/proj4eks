terraform {
  source = "${find_in_parent_folders("terraform-modules")}/06-helm/01-defectdojo"
}

include "common"{
  path = find_in_parent_folders("common.hcl")
}

inputs = {
  helm_name_defectdojo = "defectdojo"

  helm_namespace_defectdojo = "ddojo"

  helm_repository_defectdojo = "./"

  helm_chart_defectdojo = "defectdojo"

  helm_values_defectdojo = "./defectdojo/values.yaml"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
EOF
}