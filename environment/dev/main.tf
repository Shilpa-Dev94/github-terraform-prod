# 1. Resource Group Module
module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.dev_rgs
}

# 2. Virtual Network Module
module "virtual_network" {
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.dev_vnets
  depends_on = [module.resource_group]
}

# 3. Subnet Module
module "subnet" {
  source     = "../../modules/azurerm_subnet"
  subnets    = var.dev_subnets
  depends_on = [module.virtual_network]
}

# 4. Public IP Module
module "public_ip" {
  source = "../../modules/azurerm_public_ip"
  pips   = var.dev_pips
  depends_on = [module.resource_group] 
}

# 5. Network Interface Module
module "nic" {
  source = "../../modules/azurerm_nic"

  nics = {
    for k, v in var.nics : k => {
      name                 = v.name
      resource_group_name  = v.resource_group_name
      location             = v.location
      subnet_id            = module.subnet.subnet_ids[v.subnet_key]
      public_ip_address_id = module.public_ip.public_ip_ids[v.pip_key]
      tags                 = v.tags
    }
  }

  depends_on = [module.subnet, module.public_ip]
}

# 6. Linux Virtual Machine Module
module "virtual_machine" {
  source = "../../modules/azurerm_linux_virtual_machine"

  vms = {
    for k, v in var.dev_vms : k => {
      name                  = v.name
      resource_group_name   = v.resource_group_name
      location              = v.location
      size                  = v.size
      admin_username        = v.admin_username
      admin_password        = v.admin_password
      network_interface_ids = [module.nic.nic_ids[v.nic_key]]
      tags                  = v.tags
    }
  }

  depends_on = [module.nic]
}

# 7. Storage Account Module
module "storage_account" {
  source           = "../../modules/azurerm_storage_account"
  storage_accounts = var.dev_storage_accounts
  depends_on       = [module.resource_group]
}