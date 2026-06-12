resource "azurerm_network_interface" "main" {
  for_each = var.rg-vn-vm

  name                = "${each.key}-nic"
  location            = azurerm_resource_group.RG-VM[each.key].location
  resource_group_name = azurerm_resource_group.RG-VM[each.key].name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal1[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}