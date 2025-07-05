variable "virtual_network_name" {
  description = "name of the virtual network"
  type = string
}

variable "virtual_network_location" {
    description = "virtual network location"
    type = string
}

variable "resource_group_name" {
    description = "virtual network resource group"
    type = string 
}

variable "address_space" {
    description = "address space of the virtual network"
    type = list(string) 
}

