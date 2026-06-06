variable "resource_group_name" {}
 
 variable "foreach" {}

 variable "storage_account_nested" {}
 

 variable "storage_accounts" {
  type = list(string)

  default = [
    "ironwolfsa01",
    "ironwolfsa02",
    "ironwolfsa03",
    "ironwolfsa04",
    "ironwolfsa05",
    "ironwolfsa06",
    "ironwolfsa07",
    "ironwolfsa08",
    "ironwolfsa09",
    "ironwolfsa10",
    "ironwolfsa11",
    "ironwolfsa12",
    "ironwolfsa13",
    "ironwolfsa14",
    "ironwolfsa15",
    "ironwolfsa16",
    "ironwolfsa17",
    "ironwolfsa18",
    "ironwolfsa19",
    "ironwolfsa20"
  ]
}