variable "name" {
  description = "Name of vpc"
  type = string
}
variable "auto_create_subnetworks" {
  description = "Create default region subnetworks"
  type = bool
  default = true
}