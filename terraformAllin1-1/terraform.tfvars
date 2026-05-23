Rg1 = "variabletest1" # value for variable is entered in terraform.tfvars file and it will automatically pick the value from there and create resource with that value.
Rg2 = "variabletest2"
Rg3 = "variabletest3"

foreach = { "RG-1" = "eastus", "RG-2" = "westus2", "RG-3" = "australiaeast", "RG-4" = "southeastasia", "RG-5" = "northeurope", "RG-6" = "swedencentral", "RG-7" = "westeurope", "RG-8" = "uksouth", "RG-9" = "centralus", "RG-10" = "centralindia" }
# for each is used to create multiple resources with the help of map variable. In above example 10 resource groups will be created with the help of for each and map variable.
toset-test = ["RG-21", "RG-22", "RG-23", "RG-24", "RG-25"] # toset is used to convert list to set and set does not allow duplicate values. In above example 5 resource groups will be created with the help of for each and toset function.

storage_account = { #map trial with multiple values to enter vias variable.
  stg = {
    name                     = "lattrial1" #key = value
    resource_group_name      = "cloudState" # key = value
    location                 = "westeurope"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }

  Stg2 = { #key = value
    name                     = "lattrial2"
    resource_group_name      = "cloudState"
    location                 = "westeurope"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

storage_account_nested = {  # map inside map is called  nested map. 
    sa1 = { #key = value
      name                     = "lattrial3" #key = value
      resource_group_name      = "cloudState" # key = value
      location                 = "westus"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    }
    sa2 = { #key = value
      name                     = "lattrial4"
      resource_group_name      = "cloudState"
      location                 = "westeurope"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
    sa3 = { #key = value
      name                     = "lattrial5"
      resource_group_name      = "cloudState"
      location                 = "eastus"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    }
  }