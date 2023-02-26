
# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx"
}

variable "subname" {
  type    = string
  default = "subnames"
}

locals {
  container_name = "tim-zijn-container-${var.subname}"
}


# Create a container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = local.container_name
}
