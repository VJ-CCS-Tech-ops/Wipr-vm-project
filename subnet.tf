
resource "azurerm_subnet" "subnet"{
  name = "mysubnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = "rg-metro-digital-rig" //azurerm_resource_group.net.name
  address_prefixes = ["10.0.1.0/24"]
}
