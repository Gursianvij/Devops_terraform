resource "azurerm_resource_group" "ironwolf" {
  name     = "ironwolf-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "ironwolf" {
  name                = "ironwolf-network"
  resource_group_name = azurerm_resource_group.ironwolf.name
  location            = azurerm_resource_group.ironwolf.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_storage_account" "ironwolf" {
  name                     = "ironwolfstoraccount"
  resource_group_name      = azurerm_resource_group.ironwolf.name
  location                 = azurerm_resource_group.ironwolf.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "ironwolf" {
  name                  = "ironwolf-container"
  storage_account_id    = azurerm_storage_account.ironwolf.id
  container_access_type = "private"
}



resource "azurerm_resource_group" "ironwolf1" {
  name     = var.resource_group_name
  location = "West Europe"
}

resource "azurerm_resource_group" "ironwolf2" {
 for_each = var.foreach
  name     = each.key
  location = each.value
}


resource "azurerm_storage_account" "ironwolf3" {
  for_each = var.storage_account_nested
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  tags = {
    environment = "staging"
  }
}



resource "azurerm_resource_group" "module_rg" {
  name     = "ironwolf-module-rg"
  location = "Spain Central"
}

module "storage_account" {
  source                   = "aztfm/storage-account/azurerm"
  version                  = ">=1.0.0"
  name                     = "ironwolfstoraccount2"
  resource_group_name      = azurerm_resource_group.module_rg.name
  location                 = azurerm_resource_group.module_rg.location
  account_tier             = "Standard"
  account_replication_type = "ZRS"
}

resource "azurerm_resource_group" "rg" {
  name     = "ironwolf007-module-rg"
  location = "Central India"
}

module "storage_accounts" {

  for_each = toset(var.storage_accounts)

  source  = "aztfm/storage-account/azurerm"
  version = ">=1.0.0"

  name                     = each.value
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}