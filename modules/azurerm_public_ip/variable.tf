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