output "subnetwork" {
  value = google_compute_subnetwork.subnetwork.self_link
  depends_on = [module.vm]
}