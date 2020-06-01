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
  source = "./modules/vpc"
  name   = "vpc1" 
}

module "firewall_module1" {
  source      = "./modules/firewall"
  name        = "allow-ssh" 
  network     = module.vpc_module1.vpc
  priority    = "999"
  protocol    = "tcp"
  ports       = ["22"]
  target_tags = ["staging"]
}

module "firewall_module2" {
  source      = "./modules/firewall"
  name        = "allow-http" 
  network     = module.vpc_module1.vpc
  priority    = "1000"
  description = "Allow http and https"
  protocol    = "tcp"
  ports       = ["80", "443"]
  target_tags = ["ubuntu"]
}

module "firewall_module3" {
  source      = "./modules/firewall"
  name        = "allow-icmp" 
  network     = module.vpc_module1.vpc
  priority    = "1000"
  description = "Allow icmp"
  protocol    = "icmp"
  target_tags = ["ubuntu"]
}

module "vm_module1" {
  source       = "./modules/vm"
  name         = "staging-instance"
  machine_type = "n1-standard-1"
  zone         = "europe-west3-a"
  tags         = ["ubuntu", "staging"]
  image        = "ubuntu-os-cloud/ubuntu-1804-lts"
  network      = module.vpc_module1.vpc
  nat_ip       = module.compute_address_module1.ip
}

module "sql_db_module1" {
  source           = "./modules/sql-db"
  name             = "test3"
  database_version = "POSTGRES_11"
  region           = "us-central1"
  tier             = "db-f1-micro"
}
