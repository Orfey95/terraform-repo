resource "google_compute_instance" "vm_instance_public" {
  count = var.enable_public_ip ? 1 : 0
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network
	subnetwork = var.subnetwork
	
    access_config {
      nat_ip = var.nat_ip
    }
  }
}
resource "google_compute_instance" "vm_instance_internal" {
  count = var.enable_public_ip ? 0 : 1
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network
	subnetwork = var.subnetwork	
  }
}