##############################################################################
#Para executar os TF, é necessário aprovar o terminal com o seguinte comando #
#   gcloud auth application-default login                                    #
##############################################################################

resource "google_container_cluster" "endpoints-cluster-dr" {
  addons_config {
    dns_cache_config {
      enabled = "false"
    }

    horizontal_pod_autoscaling {
      disabled = "false"
    }

    http_load_balancing {
      disabled = "false"
    }

    network_policy_config {
      disabled = "true"
    }
  }

  cluster_autoscaling {
    enabled = "false"
  }

  remove_default_node_pool    = true
  initial_node_count          = 1
  default_max_pods_per_node   = "110"
  enable_shielded_nodes       = "true"
  enable_kubernetes_alpha     = "false"
  enable_legacy_abac          = "false"
  min_master_version          = "1.22.13-gke.1000"
  location                    = "southamerica-west1"
  logging_service             = "none"

  master_auth {
    client_certificate_config {
      issue_client_certificate = "false"
    }
  }

  monitoring_service = "none"
  name               = "endpoints-cluster-dr"

  ip_allocation_policy {
    cluster_secondary_range_name  = "range-pods"
    services_secondary_range_name = "range-services"
  }

  network = "projects/br-chek-prod/global/networks/br-check"
  network_policy {
    enabled = "false"
  }

  node_locations  = ["southamerica-west1-a", "southamerica-west1-b", "southamerica-west1-c"]
  project         = "br-chek-prod"
  subnetwork      = "projects/br-chek-prod/regions/southamerica-west1/subnetworks/cash-in-subnet-dr"
}