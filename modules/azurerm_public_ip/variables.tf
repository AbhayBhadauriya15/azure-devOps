variable "public_ip_name" {
    description = "name of the public ip address"
    type = string  
}
variable "location" {
    description = "location of the oublic ip address"
    type = string
}
variable "allocation_method" {
    description = "allocation method of the public ip can be static or dynamic"
    type = string
    default = "static"
}
  variable "resource_group_name" {
    description = "name of the rg where public ip created"
    type = string
}

