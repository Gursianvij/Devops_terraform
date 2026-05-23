rg-name1  = "Moon-2"
location1 = "West Europe"
rg-name2  = "Moon-3"
location2 = "canadacentral"

rg-name3 = ["Moon-4", "Moon-5", "Moon-6", "Moon-7", "Moon-8", "Moon-9", "Moon-10", "Moon-21"]
for-each-map = { "Moon-11" = "eastus", "Moon-12" = "westus2", "Moon-13" = "southcentralus", "Moon-14" = "northeurope", "Moon-15" = "southeastasia", "Moon-16" = "westus", "Moon-17" = "eastasia" }

nestedmap ={
      sa1 = { #key = value
      name                     = "stgaccountx" #key = value
      resource_group_name      = "Moon-1" # key = value
      location                 = "westus"      
      account_tier             = "Standard"
      account_replication_type = "GRS"
    }
    sa2 = { #key = value
      name                     = "stgaccounty"
      resource_group_name      = "Moon-1"
      location                 = "westeurope"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
    sa3 = { #key = value
      name                     = "stgaccountz"
      resource_group_name      = "Moon-1"
      location                 = "eastus"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    }
  }

