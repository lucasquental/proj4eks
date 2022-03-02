provider "helm"{
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "proj2k8s" {
  name       = "prod"

  repository = "./"
  chart      = "prod"

  values = [
    file("./values.yaml")
  ]
}
