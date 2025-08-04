# Resource Group to contain all Azure Resources
resource "azurerm_resource_group" "aks-rg" {
    location = var.location
    name     = "${var.prefix}-AKS-rg"
}