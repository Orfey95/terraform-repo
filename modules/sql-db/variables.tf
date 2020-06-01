variable "name" {
  description = "Name of SQL DB"
  type = string
}
variable "database_version" {
  description = "Version of SQL DB"
  type = string
}
variable "region" {
  description = "Region of SQL DB"
  type = string
}
variable "tier" {
  description = "Machine type of SQL DB"
  type = string
}