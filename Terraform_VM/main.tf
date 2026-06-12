

resource "azurerm_resource_group" "RG-VM" {
  for_each = var.rg-vn-vm
  name     = each.key
  location = each.value
}



