#boolean concept rg defined in terraform.tfvars
resource "azurerm_resource_group" "rgconnect" {
    count = var.rg ? 2:0
  name     = "rg1"
  location = "West Europe"
}


#simple count usage
resource "azurerm_resource_group" "rgconnect" {
    count = 2
  name     = "rg1"
  location = "West Europe"
}

#indexing concept of count being used
resource "azurerm_storage_account" "saconnect" {
    count = 1
  name                     = "stor94792"
  resource_group_name      = azurerm_resource_group.rgconnect[count.index].name
  location                 = azurerm_resource_group.rgconnect[count.index].location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
