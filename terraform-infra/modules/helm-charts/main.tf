resource "helm_release" "java_app" {
  name = "${var.project}-java"
  chart = "${path.module}/java-app"
  namespace = "default"

  values = [ file("${path.module}/java-app/values.yaml") ]

  set{
    name = "image.repository"
    value = var.image_repo
  }

  set{
    name = "image.tag"
    value = var.image_tag
  }
}