variable "cluster_name" {
  description = "GKE Name"
  type = string
}

variable "credential" {
  description = "Google Cloud Service Account Key"
  type = string
}

variable "gke_num_nodes" {
  default     = 3
  description = "number of gke nodes for Node Pool "
}

variable "project" {
  default = "fsmakka"
  description = "Google Cloud Platform Project Name"
  type = string
}

variable "region" {
  default = "europe-west3"
  description = "GKE Region"
  type = string
}

variable "subnetwork_ip_range" {
  default = "10.40.0.0/20"
  description = "Google Cloud Subnetwork IP Range"
  type = string
}

variable "subnetwork_pods_ip_range" {
  default = "10.41.0.0/14"
  description = "Google Cloud Subnetwork Pods IP Range"
  type = string
}

variable "subnetwork_services_ip_range" {
  default = "10.42.0.0/20"
  description = "Google Cloud Subnetwork Services IP Range"
  type = string
}

variable "vpa_enabled" {
  default = false
  description = "GKE Vertical Pod Autoscaling Enabled"
  type = bool
}

variable "zone" {
  default = "europe-west3-c"
  description = "GKE Zone"
  type = string
}