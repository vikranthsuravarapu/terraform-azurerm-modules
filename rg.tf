provider "azurerm" {
  version = "~>2.0"
  features {}
}
resource "azurerm_resource_group" "rename" {
  name     = "var.rgname"
  location = "var.location"
  
}
