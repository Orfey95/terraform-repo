resource "google_compute_network" "vpc_network" {
  name                    = var.name
  auto_create_subnetworks = var.auto_create_subnetworks
}