module "resource_group" {
  source                  = "../modules/azurerm_resource_group"
  resource_group_name     = "rg-todoapp"
  resource_group_location = "centralindia"
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../modules/azurerm_virtual_network"

  virtual_network_name     = "vnet-todoapp"
  virtual_network_location = "centralindia"
  resource_group_name      = "rg-todoapp"
  address_space            = ["10.0.0.0/16"]
}

module "frontend_subnet" {
  depends_on = [module.virtual_network]
  source     = "../modules/azurerm_subnet"

  resource_group_name  = "rg-todoapp"
  virtual_network_name = "vnet-todoapp"
  subnet_name          = "frontend-subnet"
  address_prefixes     = ["10.0.1.0/24"]

}

module "backend_subnet" {
  depends_on = [module.virtual_network]
  source     = "../modules/azurerm_subnet"

  resource_group_name  = "rg-todoapp"
  virtual_network_name = "vnet-todoapp"
  subnet_name          = "backend-subnet"
  address_prefixes     = ["10.0.2.0/24"]

}

module "public_ip" {
  depends_on          = [module.resource_group]
  source              = "../modules/azurerm_public_ip"
  public_ip_name      = "pip-todoapp"
  resource_group_name = "rg-todoapp"
  location            = "centralindia"
  allocation_method   = "Static"
}
module "backend_public_ip" {
  depends_on          = [module.resource_group]
  source              = "../modules/azurerm_public_ip"
  public_ip_name      = "pip-backend"
  resource_group_name = "rg-todoapp"
  location            = "centralindia"
  allocation_method   = "Static"

}
# module "azurerm_key_vault" {
#   source              = "../modules/azurerm_key_vault"
#   resource_group_name = "rg-todoapp"
#   location            = "centralindia"
#   keyvault_name       = "lockerab"
# }

module "frontend_vm" {
  depends_on           = [module.public_ip, module.frontend_subnet]

  
  source               = "../modules/azurerm_virtual_machine"
  resource_group_name  = "rg-todoapp"
  location             = "centralindia"
  vm_name              = "vm-frontend"
  vm_size              = "Standard_B1s"
  image_publisher      = "Canonical"
  image_offer          = "UbuntuServer"
  image_sku            = "18.04-LTS"
  image_version        = "latest"
  nic_name             = "nic-vm-frontend"
  virtual_network_name = "vnet-todoapp"
  subnet_name          = "frontend-subnet"
  public_ip            = "pip-todoapp"

}

module "backend_vm" {

  depends_on           = [module.backend_public_ip, module.backend_subnet]
  source               = "../modules/azurerm_virtual_machine"
  resource_group_name  = "rg-todoapp"
  location             = "centralindia"
  vm_name              = "vm-backend"
  vm_size              = "Standard_B1s"
  admin_username       = "admin12
  admin_password       = "Admin@12345"
  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-focal"
  image_sku            = "20_04-lts"
  image_version        = "latest"
  nic_name             = "nic-vm-backend"
  virtual_network_name = "vnet-todoapp"
  subnet_name          = "backend-subnet"
  public_ip            = "pip-backend"

}

module "sql_server" {
  source                       = "../modules/azurerm_sql_server"
  sql_server_name              = "todosqlserver7865"
  resource_group_name          = "rg-todoapp"
  location                     = "centralindia"
  administrator_login          = "sqladmin"
  administrator_login_password = "Admin@1234"

}

