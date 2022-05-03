provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "defectdojo" {
  name = var.helm_name_defectdojo
  namespace = var.helm_namespace_defectdojo
  repository = var.helm_repository_defectdojo
  chart      = var.helm_chart_defectdojo
  dependency_update = true
  create_namespace = true

  values = [
    file(var.helm_values_defectdojo)
  ]
}
