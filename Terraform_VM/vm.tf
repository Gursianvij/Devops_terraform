resource "azurerm_virtual_machine" "VM-1" {
  for_each = var.rg-vn-vm
  name                  = "${each.key}-vm"
  location              = azurerm_resource_group.RG-VM[each.key].location
  resource_group_name   = azurerm_resource_group.RG-VM[each.key].name
  network_interface_ids = [azurerm_network_interface.main[each.key].id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${each.key}-vm"
    admin_username = "DevopsInsider"
    admin_password = "Abcde@54321"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}