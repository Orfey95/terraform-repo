provider "google" {
  credentials = "./account.json"
  project     = var.project
  region      = var.region
}

module "compute_address_module1" {
  source = "./modules/compute-address"
  name   = "test-ip1" 
}

module "compute_address_module2" {
  source = "./modules/compute-address"
  name   = "test-ip2" 
}

module "vm_module1" {
  source       = "./modules/vm"
  name         = "staging-instance"
  machine_type = "n1-standard-1"
  zone         = "europe-west3-a"
  tags         = ["ubuntu", "staging"]
  image        = "ubuntu-os-cloud/ubuntu-1804-lts"
  network      = "default"
  nat_ip       = module.compute_address_module1.ip
}

module "vm_module2" {
  source       = "./modules/vm"
  name         = "prod-instance"
  machine_type = "n1-standard-1"
  zone         = "europe-west3-b"
  tags         = ["centos", "prod"]
  image        = "centos-cloud/centos-7"
  network      = "default"
  nat_ip       = module.compute_address_module2.ip
}