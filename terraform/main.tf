terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.27.0"
    }
  }
  backend "gcs" {
    bucket  = "terraform-state-fsmakka"
    prefix  = "dev"
  }
  required_version = ">= 0.14"
}