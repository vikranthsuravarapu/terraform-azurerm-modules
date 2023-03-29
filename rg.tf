terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Localtestvik"

    workspaces {
      name = "testlocal"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
     
    }
  }
}

provider "azurerm" {
 subscription_id = "57cc9967-b52d-414d-b422-b0791a491704"
 client_id       = "bac413bf-a608-4495-a89a-6095443272d1"
  client_secret   = "6aW8Q~JtTLwmlUI4ukiogyONzPSSf5~ytHVVzbit"
  tenant_id       = "513294a0-3e20-41b2-a970-6d30bf1546fa"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "testRG"
  location = "westus2"
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/28"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name
}

