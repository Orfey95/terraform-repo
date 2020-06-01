variable "name" {
  description = "Name of the firewall"
  type = string
}
variable "direction" {
  description = "Direction of the firewall"
  type = string
  default = "INGRESS"
}
variable "network" {
  description = "Linking the firewall to the network"
  type = string
}
variable "priority" {
  description = "Priority of the firewall"
  type = string
  default = "1000"
}
variable "description" {
  description = "Description of the firewall"
  type = string
  default = ""
}
variable "protocol" {
  description = "Protocol of the firewall"
  type = string
}
variable "ports" {
  description = "Ports of the firewall"
  type = list(string)
  default = []
}
variable "target_tags" {
  description = "Linking the firewall to the network tags"
  type = list(string)
}