variable "prefix" {
    default     = ""
    type        = string
    description = "naming prefix for all resources"
}

variable "location" {
    default = ""
    type = string
    description = "azure region to deploy all azure resources to"
}

variable "address_space" {
    default = ""
    type = string
    description = "IP range to be used for both the Vnet and its one subnet"
}
