terraform {
  backend "gcs" {
    bucket  = "terraform-state-fsmakka"
    prefix  = "dev"
  }
}