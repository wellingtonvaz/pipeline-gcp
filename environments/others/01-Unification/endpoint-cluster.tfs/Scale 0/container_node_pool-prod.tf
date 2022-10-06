resource "google_container_node_pool" "endpoints-cluster_endpoints-pool-1-prod" {
  cluster            = google_container_cluster.endpoints-cluster-prod.name
  initial_node_count = "0" ## Para escalar o NodePool, mude o "initial_node_count" de 0 para 1 nesta linha. Se quiser escalar a zero mude de 1 para 0 ##
  location           = "us-east1"

# Descomentar as linhas do bloco "autoscaling", salvar o arquivo e executar o terraform plan e apply. ##
## Para escalar a zero novamente o NodePool, comente as linhas do bloco "autoscaling", salve o arquivo e execute o terraform plan e apply ##
#  autoscaling {
#    min_node_count = "1"
#    max_node_count = "2"
#  }

  management {
    auto_repair  = "true"
    auto_upgrade = "false"
  }

  max_pods_per_node = "110"
  name              = "endpoints-pool-1-prod"

  node_config {
    disk_size_gb    = "50"
    disk_type       = "pd-ssd"
    image_type      = "COS_CONTAINERD"
    machine_type    = "n1-standard-1"
    oauth_scopes    = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
    preemptible     = "false"
    service_account = "default"

    labels = {
      env = "prod"
    }

    metadata = {
      disable-legacy-endpoints = "true"
    }

    shielded_instance_config {
      enable_integrity_monitoring = "true"
      enable_secure_boot          = "true"
    }
  }

  upgrade_settings {
    max_surge       = "1"
    max_unavailable = "0"
  }

  node_locations = ["us-east1-a", "us-east1-b", "us-east1-c"]
  project        = "unik-gke-prd"
}