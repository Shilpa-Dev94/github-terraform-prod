resource "azurerm_public_ip" "pip" {
  for_each            = var.pips
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = lookup(each.value, "sku", "Standard") # <--- Yaha fix kiya hai (Default Standard rakha hai)
  tags                = each.value.tags
}