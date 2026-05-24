resource "azurerm_resource_group" "Moon1" {
  name     = "Moon-1"
  location = "West Europe"
}

resource "azurerm_resource_group" "Moon2" {
  name     = var.rg-name1
  location = var.location1
}

resource "azurerm_resource_group" "Moon3" {
  name     = var.rg-name2
  location = var.location2
}

resource "azurerm_resource_group" "Moon4" {
  for_each = toset(var.rg-name3)
  name     = each.key
  location = "Centralindia"
}

resource "azurerm_resource_group" "Moon5" {
  for_each = var.for-each-map
  name     = each.key
  location = each.value
}


resource "azurerm_storage_account" "nestedmaptrial"{
  for_each = var.nestedmap
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

resource "azurerm_storage_container" "container" {
  for_each = var.nestedmap
  name                  = "statebkend"
  storage_account_id    = azurerm_storage_account.nestedmaptrial[each.key].id
  container_access_type = "private"
}