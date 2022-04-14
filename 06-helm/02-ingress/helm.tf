provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

data  "helm_repository" "entrada" {
  name =  " ingress " 
  url   =  " https://kubernetes.github.io/ingress-nginx/ " 
}

resource "helm_release" "ingress-nginx" {
  name       = "ingress-nginx"
  namespace = "nginx-controller"
  repository = data.helm_repository.ingress.metadata.0.name
  chart      = "ingress-nginx/ingress-nginx"
  dependency_update = true
  create_namespace = true
}