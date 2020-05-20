data "google_compute_network" "default" {
  project = var.project_id
  name    = "default"
}

data "google_compute_zones" "available" {
}
