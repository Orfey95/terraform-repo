output "vpc" {
  value = google_compute_network.vpc_network.self_link
  depends_on = [module.vm, module.sql-db, module.subnetwork]
}