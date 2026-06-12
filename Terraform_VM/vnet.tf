resource "azurerm_virtual_network" "main" {
  for_each = var.rg-vn-vm

  name                = "${each.key}-vnet"
  location            = azurerm_resource_group.RG-VM[each.key].location
  resource_group_name = azurerm_resource_group.RG-VM[each.key].name

  address_space = ["10.0.0.0/16"]
}