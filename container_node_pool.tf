resource "google_container_node_pool" "tfer--c-slcm2_default-0" {
  autoscaling {
    max_node_count = var.max_node_count
    min_node_count = var.min_node_count
  }

  cluster  = google_container_cluster.tfer--c-slcm2.name
  location = var.cluster_location

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }

  max_pods_per_node = var.max_pods_per_node
  name              = var.node_name
  node_config {
    disk_size_gb    = var.disk_size_gb
    disk_type       = var.disk_type
    image_type      = var.image_type
    local_ssd_count = var.local_ssd_count
    machine_type    = var.machine_type

    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes    = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
    preemptible     = "false"
    service_account = "default"

    shielded_instance_config {
      enable_integrity_monitoring = "true"
      enable_secure_boot          = "false"
    }

    tags = ["kaas-rancher-dev"]
  }

  node_count     = "1"
  node_locations = var.node_locations
  project        = var.project_name



  upgrade_settings {
    max_surge       = "1"
    max_unavailable = "0"
  }

  version = var.cluster_version

}
