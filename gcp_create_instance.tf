provider "google" {
  credentials = "${file("top-script-272714-2bcdbfb8d2be.json")}"
  project = "top-script-272714"
  region = "europe-west3"
  zone = "europe-west3-a"
}

resource "random_id" "instance_id" {
  byte_length = 8
}


resource "google_compute_address" "test-static-ip-address" {
  name = "static-ip-${random_id.instance_id.hex}"
}

resource "google_compute_instance" "vm_instance" {
  name = "tf-instance-${random_id.instance_id.hex}"
  machine_type = "n1-standard-2"
  
  tags = ["foo", "bar"]
  
  boot_disk {
    initialize_params {
	  image = "ubuntu-os-cloud/ubuntu-1804-lts"
	}
  }

  metadata_startup_script = "sudo apt update; sudo apt -y install nginx"
  
  network_interface {
    network = "default"
    access_config {
	  nat_ip = "${google_compute_address.test-static-ip-address.address}"
	}
  }
  
  metadata = {
    sshKeys = "Aleksandr:${file("id_rsa.pub")}"
  }
}

resource "google_compute_firewall" "default" {
  name    = "nginx-firewall"
  network = "default"
 
  allow {
    protocol = "tcp"
    ports    = ["80","443"]
  }
 
  allow {
    protocol = "icmp"
  }
}

output "ip" {
  value = "${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}"
}

