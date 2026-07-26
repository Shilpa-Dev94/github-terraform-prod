variable "rgs" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  description = "Map of resource groups to create"
}