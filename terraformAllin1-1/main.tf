resource "azurerm_resource_group" "trial1" {
  name     = "trial1-1"
  location = "West Europe"
}

resource "azurerm_resource_group" "trial11" {
  name     = "trial1-11" 
  location = "West Europe"
}

resource "azurerm_resource_group" "trial2" {
  name     = var.Rg1
  location = "West Europe"
}

resource "azurerm_resource_group" "trial3" {
  name     = var.Rg2
  location = "West Europe"
}

resource "azurerm_resource_group" "trial4" {
  name     = var.Rg3 # for each is used to create multiple resources with the help of map variable.
  location = "West Europe"
}


resource "azurerm_resource_group" "trial5" {
  for_each = var.foreach # for each is used to create multiple resources with the help of map variable.
  name     = each.key
  location = each.value
}

resource "azurerm_resource_group" "trial6" {
  for_each = toset(var.toset-test) # toset is used to convert list to set and set does not allow duplicate values.
  name     = each.key
  location = "West Europe"
}


resource "azurerm_storage_account" "maptrial" {
  for_each = var.storage_account #map trial with multiple values to enter vias variable.

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}


resource "azurerm_storage_account" "nestedmaptrial" {
  for_each = var.storage_account_nested #nested map trial with multiple values to enter vias variable.
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}
