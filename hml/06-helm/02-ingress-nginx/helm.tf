provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx-controller" {
  name       = var.helm_name_nginx
  namespace = var.helm_namespace_nginx
  repository = var.helm_repository_nginx
  chart      = var.helm_chart_nginx
  dependency_update = true
  create_namespace = true
}