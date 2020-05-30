output "ip" {
  value = google_compute_address.static_ip_address.address
  depends_on = [module.vm]
}