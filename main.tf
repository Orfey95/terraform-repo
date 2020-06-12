provider "google" {
  credentials = "./account.json"
  project     = var.project
  region      = var.region
}

module "compute_address_module1" {
  source = "./modules/compute-address"
  name   = "test-ip1" 
}

module "vpc_module1" {
  source                  = "./modules/vpc"
  name                    = "vpc1" 
  auto_create_subnetworks = false
}

module "firewall_module1" {
  source      = "./modules/firewall"
  name        = "allow-ssh" 
  network     = module.vpc_module1.vpc
  priority    = "999"
  protocol    = "tcp"
  ports       = ["22"]
  target_tags = ["ubuntu"]
}

module "subnetwork_module1" {
  source        = "./modules/subnetwork"
  name          = "subnetwork1"
  ip_cidr_range = "10.2.0.0/16"
  region        = "europe-west3"
  network       = module.vpc_module1.vpc
}

module "vm_module2" {
  source           = "./modules/vm"
  enable_public_ip = true
  name             = "prod-instance"
  machine_type     = "n1-standard-1"
  zone             = "europe-west3-a"
  tags             = ["ubuntu", "prod"]
  image            = "ubuntu-os-cloud/ubuntu-1804-lts"
  subnetwork       = module.subnetwork_module1.subnetwork
  nat_ip           = module.compute_address_module1.ip
}
