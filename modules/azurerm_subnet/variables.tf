variable "resource_group_name" {
    description = "resource grouo of subnet"
    type    = string 
}
variable "virtual_network_name" {
    description = "virtual network of subnet"
    type = string 
}

variable "subnet_name" {
    description = "name of the subnet"
    type = string
}

variable "address_prefixes" {
    description = "address prefixes of subnet"
    type = list(string)
  
}
