resource "azurerm_resource_group" "udemy_terraform_rg" {
  name     = "udemy_terraform_rg"
  location = "East US"
  tags = {
    name = "udemy",
    course = "terraform"
  }
}