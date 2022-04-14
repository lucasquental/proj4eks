provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx-controller" {
  name       = "nginx-controller"
  namespace = "nginx-controller"
  repository = "https://kubernetes.github.io/ingress-nginx/"
  chart      = "ingress-nginx"
  dependency_update = true
  create_namespace = true
}

  set {
    name  = "controller.ingressClassResource.enabled"
    value = "true"
  }