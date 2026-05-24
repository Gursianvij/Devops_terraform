

resource "azurerm_resource_group" "CloudStateg" {
  name     = "cloudState"
  location = "West Europe"
}

resource "azurerm_storage_account" "cloudstatestorage" {
  name                     = "cloudstate2020"
  resource_group_name      = azurerm_resource_group.CloudStateg.name
  location                 = azurerm_resource_group.CloudStateg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "example" {

  name                  = "xyz2304"
  storage_account_id    = azurerm_storage_account.cloudstatestorage.id
  container_access_type = "private"
}

