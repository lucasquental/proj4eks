provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "ingress-nginx" {
  name       = "ingress-nginx"
  namespace = "nginx-controller"
  repository = "https://kubernetes.github.io/ingress-nginx/"
  chart      = "ingress-nginx/ingress-nginx"
  dependency_update = true
  create_namespace = true
}