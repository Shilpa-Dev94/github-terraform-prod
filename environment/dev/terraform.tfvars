dev_rgs = {
  "rg1" = {
    name     = "rg-dev-app-eastus"
    location = "East US"
    tags     = { Environment = "Dev", ManagedBy = "Terraform" }
  }
}

dev_vnets = {
  "vnet1" = {
    name                = "vnet-dev-eastus"
    location            = "East US"
    resource_group_name = "rg-dev-app-eastus"
    address_space       = ["10.0.0.0/16"]
    tags                = { Environment = "Dev" }
  }
}

dev_subnets = {
  "subnet1" = {
    name                 = "snet-dev-eastus"
    resource_group_name  = "rg-dev-app-eastus"
    virtual_network_name = "vnet-dev-eastus"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

dev_pips = {
  pip1 = {
    name                = "dev-public-ip"
    resource_group_name = "rg-dev-app-eastus"
    location            = "eastus"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags                = { Environment = "Dev" }
  }
}

nics = {
  "nic1" = {
    name                = "nic-dev-vm-eastus"
    resource_group_name = "rg-dev-app-eastus"
    location            = "East US"
    subnet_key          = "subnet1"
    pip_key             = "pip1"
    tags                = { Environment = "Dev" }
  }
}

dev_vms = {
  "vm1" = {
    name                = "vm-dev-app-01"
    resource_group_name = "rg-dev-app-eastus"
    location            = "East US"
    size                = "Standard_B1s"
    admin_username      = "azureadmin"
    admin_password      = "P@ssw0rd123456!" # Production me Azure Key Vault ya GitHub Secrets se aata hai
    nic_key             = "nic1"
    tags                = { Environment = "Dev" }
  }
}

dev_storage_accounts = {
  "sa1" = {
    name                     = "stdevappdata998811" # Worldwide unique name (lowercase & numbers only)
    resource_group_name      = "rg-dev-app-eastus"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags                     = { Environment = "Dev" }
  }
}