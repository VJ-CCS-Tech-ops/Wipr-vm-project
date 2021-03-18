
resource "azurerm_public_ip" "example" {
  for_each                = toset(var.vmname)
  name                    = each.value
  location                = var.location           //azurerm_resource_group.example.location
  resource_group_name     = "rg-metro-digital-rig"    //azurerm_resource_group.example.name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

  tags = {
    environment = "test"
  }
}


resource "azurerm_network_interface" "nic"{
  for_each = toset(var.vmname)
  name = each.value
  location = var.location
  resource_group_name = "rg-metro-digital-rig" //azurerm_resource_group.app.name

  ip_configuration {
    name = "ipconfig"
    subnet_id = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id  = azurerm_public_ip.example[each.key].id
  }
}
