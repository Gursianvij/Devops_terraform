resource "azurerm_subnet" "internal1" {
  for_each = var.rg-vn-vm

  name                 = "internal-subnet-1"
  resource_group_name  = azurerm_resource_group.RG-VM[each.key].name
  virtual_network_name = azurerm_virtual_network.main[each.key].name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "internal2" {
  for_each = var.rg-vn-vm

  name                 = "internal-subnet-2"
  resource_group_name  = azurerm_resource_group.RG-VM[each.key].name
  virtual_network_name = azurerm_virtual_network.main[each.key].name
  address_prefixes     = ["10.0.3.0/24"]
}