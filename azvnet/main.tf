resource "azurerm_resource_group" "udemy_terraform_rg" {
  name     = "udemy_terraform_rg"
  location = "East US"
  tags = {
    name = "udemy",
    course = "terraform"
  }
}

# resource "azurerm_network_security_group" "example" {
#   name                = "example-security-group"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

resource "azurerm_virtual_network" "main" {
  name                = "udemy_vnet"
  location            = "East US"
  resource_group_name = azurerm_resource_group.udemy_terraform_rg.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    name = "udemy",
    course = "terraform"
  }
}

resource "azurerm_subnet" "internal" {
  name                = "udemy_internal_subnet"
  resource_group_name = azurerm_resource_group.udemy_terraform_rg.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = ["10.0.0.0/24"]
}