variable "vms" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    admin_password      = string
    network_interface_ids = list(string)
    tags                = map(string)
  }))
}