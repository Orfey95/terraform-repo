resource "google_sql_database_instance" "sql_db" {  
  name             = var.name
  database_version = var.database_version
  region           = var.region
  
  settings {
    tier = var.tier
  }  
}
