resource "azurerm_resource_group" "rgtest" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_servicebus_namespace" "example" {
  name                = var.namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  tags = {
    source = "terraform"
  }
}

resource "azurerm_servicebus_queue" "example" {
  name         = var.testqueue
  namespace_id = azurerm_servicebus_namespace.example.id

  enable_partitioning = true
}