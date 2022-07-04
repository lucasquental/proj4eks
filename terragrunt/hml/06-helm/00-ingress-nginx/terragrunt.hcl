terraform {
  source = "${find_in_parent_folders("terraform-modules")}/06-helm/00-ingress-nginx"
}

include "common"{
  path = find_in_parent_folders("common.hcl")
}

inputs = {
  helm_name_nginx = "nginx-controller"

  helm_namespace_nginx = "nginx-controller"

  helm_repository_nginx= "https://kubernetes.github.io/ingress-nginx/"

  helm_chart_nginx = "ingress-nginx"
}