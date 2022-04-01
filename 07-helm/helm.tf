provider "remote-exec" {
  command = "git clone https://github.com/DefectDojo/django-DefectDojo/tree/dev/helm"
}


provider "helm"{
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "defectdojo" {
  name       = "defectdojo"

  repository = "./"
  chart      = "defectdojo"

  values = [
    file("./defectdojo/values.yaml")
  ]
}
