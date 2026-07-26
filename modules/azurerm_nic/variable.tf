variable "nics" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    subnet_key          = optional(string)
    pip_key             = optional(string)
    subnet_id           = optional(string)
    public_ip_address_id = optional(string)
    tags                = map(string)
  }))
}