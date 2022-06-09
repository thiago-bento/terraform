resource "google_container_cluster" "tfer--c-slcm2" {
  addons_config {
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



  database_encryption {
    state = "DECRYPTED"
  }

  default_max_pods_per_node = "20"

  default_snat_status {
    disabled = "true"
  }

  enable_binary_authorization = "false"
  enable_intranode_visibility = "false"
  enable_kubernetes_alpha     = "false"
  enable_legacy_abac          = "false"
  enable_shielded_nodes       = "true"
  enable_tpu                  = "false"
  remove_default_node_pool    = true
  initial_node_count          = "1"

  workload_identity_config {
    workload_pool = "${var.project_name}.svc.id.goog"
  }


  location = var.cluster_location

  # logging_config {
  #   enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  # }

  logging_service = "logging.googleapis.com/kubernetes"

  master_auth {
    client_certificate_config {
      issue_client_certificate = "false"
    }
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "10.0.0.0/8"
    }

    cidr_blocks {
      cidr_block = "100.64.0.0/10"
    }
  }

  # monitoring_config {
  #   enable_components = ["SYSTEM_COMPONENTS"]
  # }

  monitoring_service = "monitoring.googleapis.com/kubernetes"
  name               = var.cluster_name
  network            = "projects/${var.network_project_id}/global/networks/${var.network_vpc}"
  network_policy {
    enabled  = "false"
    provider = "PROVIDER_UNSPECIFIED"
  }

  private_cluster_config {
    enable_private_endpoint = "true"
    enable_private_nodes    = "true"
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block

    master_global_access_config {
      enabled = "true"
    }


  }

  project = var.project_name

  release_channel {
    channel = "UNSPECIFIED"
  }

  resource_labels = {
    display-name = var.display_name
  }

  subnetwork = "projects/${var.network_project_id}/regions/${var.cluster_location}/subnetworks/${var.subnetwork}"

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pod_network_name
    services_secondary_range_name = var.service_network_name
  }

  min_master_version = var.cluster_version

}
