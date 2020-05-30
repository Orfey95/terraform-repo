variable "name" {
  description = "Name of vm instance"
  type = string
}
variable "machine_type" {
  description = "Machine type of vm instance"
  type = string
}
variable "zone" {
  description = "Zone of vm instance"
  type = string
}
variable "tags" {
  description = "Network tags of vm instance"
  type = list(string)
}
variable "image" {
  description = "Image (OS) of vm instance"
  type = string
}
variable "network" {
  description = "Network name of vm instance"
  type = string
}
variable "nat_ip" {
  description = "External ip address of vm instance"
  type = string
  default = ""
}