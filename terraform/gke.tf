# GKE cluster
resource "google_container_cluster" "fsmakka_cluster" {
  name     = "${var.project}-${var.cluster_name}"
  location = var.zone

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  vertical_pod_autoscaling {
    enabled = var.vpa_enabled
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "${var.project}-${var.cluster_name}-gke-pods-1"
    services_secondary_range_name = "${var.project}-${var.cluster_name}-gke-services-1"
  }

  addons_config {
    network_policy_config {
      disabled = false
    }
  }

  network_policy {
    enabled = true
  }

  lifecycle {
    ignore_changes = [
      node_pool,
      network,
      subnetwork,
      resource_labels,
    ]
  }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "fsmakka_cluster_nodes" {
  name       = google_container_cluster.fsmakka_cluster.name
  location   = var.zone
  cluster    = google_container_cluster.fsmakka_cluster.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project
    }

    # preemptible  = true
    machine_type = var.machine_type
    tags         = ["gke-node", "${var.project}-${var.cluster_name}"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}