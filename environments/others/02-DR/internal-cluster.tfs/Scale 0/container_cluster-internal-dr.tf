resource "google_container_cluster" "internal-cluster-dr" {
  addons_config {
    dns_cache_config {
      enabled = "false"
    }
    gce_persistent_disk_csi_driver_config {
      enabled = "true"
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
  vertical_pod_autoscaling {
    enabled = "true"
  }

  remove_default_node_pool    = true
  initial_node_count          = 1
  default_max_pods_per_node   = "110"
  enable_shielded_nodes       = "true"
  enable_kubernetes_alpha     = "false"
  enable_legacy_abac          = "false"
  min_master_version          = "1.22.12-gke.500"
  location                    = "southamerica-west1"
  logging_service             = "none"

  master_auth {
    client_certificate_config {
      issue_client_certificate = "false"
    }
  }

  maintenance_policy {
    recurring_window {
      end_time   = "2022-09-08T11:00:00Z"
      recurrence = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH"
      start_time = "2022-09-08T07:00:00Z"
    }
  }

  monitoring_service = "none"
  name               = "internal-cluster-dr"

  ip_allocation_policy {
    cluster_secondary_range_name  = "range-pods"
    services_secondary_range_name = "range-services"
  }

  network = "projects/bancoripley-vpn/global/networks/shared-net"
  network_policy {
    enabled  = "false"
  }

  node_locations  = ["southamerica-west1-a", "southamerica-west1-b", "southamerica-west1-c"]
  project = "br-chek-prod"
  subnetwork = "projects/bancoripley-vpn/regions/southamerica-west1/subnetworks/subnet1-chek-dr"

}
