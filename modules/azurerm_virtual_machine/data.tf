data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "pip" {
  name                = var.public_ip
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault" "locker" {
  name                = "lockerab"
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "vm-username" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.locker.id
}

data "azurerm_key_vault_secret" "vm-password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.locker.id
}