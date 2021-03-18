
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "rg-metro-digital-rig" //azurerm_resource_group.rg.name
    }

    byte_length = 8
}

resource "azurerm_storage_account" "mystorageaccount" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name         = "rg-metro-digital-rig" //azurerm_resource_group.app.name
    location                    = var.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"
}
