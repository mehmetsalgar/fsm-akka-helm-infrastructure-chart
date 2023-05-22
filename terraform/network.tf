# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project}-${var.cluster_name}-vpc"
  #routing_mode            = "GLOBAL"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project}-${var.cluster_name}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.subnetwork_ip_range

  secondary_ip_range = [
    {
      range_name    = "${var.project}-${var.cluster_name}-gke-pods-1"
      ip_cidr_range = var.subnetwork_pods_ip_range
    },
    {
      range_name    = "${var.project}-${var.cluster_name}-gke-services-1"
      ip_cidr_range = var.subnetwork_services_ip_range
    }
  ]
}