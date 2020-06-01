resource "google_compute_firewall" "firewall" {
  name        = var.name
  direction   = var.direction
  network     = var.network
  priority    = var.priority
  description = var.description
 
  allow {
    protocol = var.protocol
    ports    = var.ports
  }
  
  target_tags = var.target_tags
}