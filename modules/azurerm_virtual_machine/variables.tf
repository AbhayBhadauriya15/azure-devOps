variable "resource_group_name" {
    description = "name of the rg in which vm created"
    type = string
}
variable "location" {
    description = "azure region where vm created"
    type = string
}
variable "vm_name" {
    description = "name of vm"
    type = string
}
variable "vm_size" {
    description = "size of the vm"
    type = string
}

variable "image_publisher" {
    description = "publisher of image to use in vm"
    type = string
}
variable "image_offer" {
    description = "offer of the image to use in vm"
    type = string
}
variable "image_sku" {
    description = "sku of image to use in vm"
    type = string
}
variable "image_version" {
    description = "version of image to use in vm"
    type = string
}
variable "nic_name" {
    description = "name of the nic for vm"
    type = string
}

variable "public_ip" {
  description = "pip ip for the vm"
  type = string
}
variable "subnet_name" {
    description = "subnet ka ip"
    type = string
}
variable "virtual_network_name" {
 description =  "vnet ka ip"
 type = string
}
# variable "azurerm_key_vault_name" {
#     type = string
# }
