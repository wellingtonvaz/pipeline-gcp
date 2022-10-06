/*resource "google_container_cluster" "endpoints-cluster-prod" {
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
  location                    = "us-east1"
  logging_service             = "none"

  master_auth {
    client_certificate_config {
      issue_client_certificate = "false"
    }
  }

  maintenance_policy {
    recurring_window {
      end_time   = "2023-09-10T10:00:00Z"
      recurrence = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH"
      start_time = "2022-09-10T05:00:00Z"
    }
  }

  monitoring_service = "none"
  name               = "endpoints-cluster-prod"

  ip_allocation_policy {
    cluster_secondary_range_name  = "unik-amosh-gke-pods-subnet"
    services_secondary_range_name = "unik-amosh-gke-services-subnet"
  }

  network = "projects/unik-shared-vpc-master/global/networks/unik-amosh-shared-vpc"
  network_policy {
    enabled = "false"
  }

  node_locations  = ["us-east1-b", "us-east1-c", "us-east1-d"]
  project         = "unik-cicd"
  subnetwork      = "projects/unik-shared-vpc-master/regions/us-east1/subnetworks/unik-amosh-gke-nodes-subnet"
}*/