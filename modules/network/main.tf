# Resource Group to contain all Azure Resources
resource "azurerm_resource_group" "vnet-rg" {
    location = var.location
    name     = "${var.prefix}-VNET-rg"
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
    name                = "${var.prefix}-VN1"
    location            = var.location
    resource_group_name = azurerm_resource_group.vnet-rg.name
    address_space       = ["${var.address_space}"]
}

# Build Array of Subnet Names/AddressRanges
locals {
    indexed_subnets = zipmap(
        range(length(azurerm_virtual_network.vnet.address_space)),
        azurerm_virtual_network.vnet.address_space
    )
}

# Create a subnet for each address range, with a unique subnet name
resource "azurerm_subnet" "subnets" {
    name                 = "${azurerm_virtual_network.vnet.name}-sbnt${each.key + 1}"
    resource_group_name  = azurerm_resource_group.vnet-rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = [each.value]
    service_endpoints   = ["Microsoft.KeyVault","Microsoft.Storage"]

    for_each = toset(local.indexed_subnets)
}