provider "google" {
  project = "calcium-blend-444112-h5"
  region  = "asia-south1"
}

resource "google_container_cluster" "primary" {
  name               = "new-kubernetes-cluster"
  location           = "asia-south1"
  initial_node_count = 1
  deletion_protection = false

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 10
  }
}

output "kubeconfig" {
  value = google_container_cluster.primary.endpoint
}

resource "helm_release" "exp-app" {
  name       = "exp-app"
  chart      = "../project/K8s"
  namespace  = "default"
  timeout    = 600
  values     = [file("../project/K8s/values.yaml")]
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
