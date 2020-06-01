output "firewall" {
  value = google_compute_firewall.firewall.network
  depends_on = [module.vpc]
}