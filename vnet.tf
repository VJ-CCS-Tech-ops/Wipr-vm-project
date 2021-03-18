resource "azurerm_virtual_network" "vnet"{
  name = "myvnet"
  location = var.location
  resource_group_name = "rg-metro-digital-rig" //azurerm_resource_group.net.name
  address_space = ["10.0.0.0/16"]
}
