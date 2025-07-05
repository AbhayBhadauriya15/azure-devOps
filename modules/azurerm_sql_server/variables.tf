variable "sql_server_name" {
description = "name of sql server"
  type = string
}
variable "resource_group_name" {
  description = "name of rg where sql server will created"
  type = string
}
variable "location" {
  description = "location of sql server"
  type = string
}
variable "administrator_login" {
    description = "administrator login of sql server"
    type = string
}
variable "administrator_login_password" {
    description = "administrator login password of sql server"
    type = string
    sensitive = true
}