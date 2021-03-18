data "azurerm_image" "packer_image" {
  for_each = toset(var.imagename)
  name = each.value
  resource_group_name = "rg-metro-digital-rig"
}


resource "azurerm_linux_virtual_machine" "myterraformvm" {
    for_each               = toset(var.vmname)
    name                  = each.value
    location              = var.location
    resource_group_name   = "rg-metro-digital-rig"  //azurerm_resource_group.app.name
    network_interface_ids = [azurerm_network_interface.nic[each.key].id]
    size                  = "Standard_DS1_v2"

    os_disk {
      name              = "${each.key}-osdisk"
      caching           = "ReadWrite"
      //create_option     = "FromImage"
      storage_account_type = "Standard_LRS"
      disk_size_gb      = "32"
    }

    data "azurerm_image" "packer_image" {
      for_each = toset(var.imagename)
      name = each.value
      resource_group_name = "rg-metro-digital-rig"
    }
  
    source_image_id = data.azurerm_image.packer_image[each.key].id
    #source_image_reference {
    #    publisher = "Canonical"
    #    offer     = "UbuntuServer"
    #    sku       = "16.04-LTS"
    #    version   = "latest"
    #}

    computer_name  = each.value
    admin_username = "${each.key}-admin"
    admin_password = "metrobank@123"
    //custom_data    = base64encode(data.template_file.linux-vm-cloud-init.rendered)
    disable_password_authentication = false

    boot_diagnostics {
        //enabled = "true"
        storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
    }
}

resource "azurerm_managed_disk" "example" {
  for_each             = toset(var.vmname)
  name                 = "${each.key}-disk1"
  location             = var.location
  resource_group_name  = "rg-metro-digital-rig" //azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  for_each           = toset(var.vmname)
  managed_disk_id    = azurerm_managed_disk.example[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.myterraformvm[each.key].id
  lun                = "1"
  caching            = "ReadWrite"
}
