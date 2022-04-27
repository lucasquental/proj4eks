provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "defectdojo" {
  name = "defectdojo"
  namespace = "ddojo"
  repository = "./"
  chart      = "defectdojo"
  dependency_update = true
  create_namespace = true

  values = [
    file("./defectdojo/values.yaml")
  ]
}