output "subnet_ids" {
    description = "Map of subnet names to their IDs"
    value = { for s in azurerm_subnet.subnets : s.name => s.id }
}

output "vnet_id" {
    description = "The virtual network ID"
    value       = azurerm_virtual_network.vnet.id
}