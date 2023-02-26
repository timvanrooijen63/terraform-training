
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "docker-desktop"
}

resource "kubernetes_namespace" "test" {
  metadata {
    name = var.namespace
  }
}

variable "namespace" {
  type        = string
  description = "Namespace in cluster"
}

variable "users" {
  type        = list(string)
  default     = ["tim", "kees", "piet"]
  description = "users"
}

output "lucky_user" {
  value = element(var.users, 5)
}
