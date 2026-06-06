resource_group_name = "ironwolf1-resources"

foreach = { "ironwolf1" = "eastus", "ironwolf2" = "westus2", "ironwolf3" = "australiaeast", "ironwolf4" = "southeastasia", "ironwolf5" = "northeurope", "ironwolf6" = "swedencentral", "ironwolf7" = "westeurope", "ironwolf8" = "uksouth", "ironwolf9" = "centralus", "ironwolf10" = "centralindia" }


storage_account_nested = {  # map inside map is called  nested map. 
    sa1 = { #key = value
      name                     = "lattrial8" #key = value
      resource_group_name      = "ironwolf1-resources" # key = value
      location                 = "westus"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    }
    sa2 = { #key = value
      name                     = "lattrial9"
      resource_group_name      = "ironwolf1-resources"
      location                 = "westeurope"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
    sa3 = { #key = value
      name                     = "lattrial10"
      resource_group_name      = "ironwolf1-resources"
      location                 = "eastus"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    }
  }