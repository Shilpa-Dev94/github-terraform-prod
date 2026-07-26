variable "dev_rgs" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "dev_vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = map(string)
  }))
}

variable "dev_subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "pips" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = optional(string, "Standard") # <--- Optional SKU added
    tags                = map(string)
  }))
}

variable "dev_nics" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    subnet_key           = string
    pip_key              = string
    tags                 = map(string)
  }))
}

variable "dev_vms" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    admin_password      = string
    nic_key             = string
    tags                = map(string)
  }))
}

variable "dev_storage_accounts" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
  }))
}