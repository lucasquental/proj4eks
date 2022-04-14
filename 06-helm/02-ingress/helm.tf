provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx-controller" {
  name       = "ingress-nginx"
  namespace = "nginx-controller"
  repository = "https://kubernetes.github.io/ingress-nginx/"
  chart      = "ingress-nginx"
  dependency_update = true
}