data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_monitor_action_group" "main" {
  name                = var.actiongroup_name
  resource_group_name = data.azurerm_resource_group.rg.name
  short_name          = var.actiongroup_name

  email_receiver {
    name          = "sends_an_email"
    email_address = var.email_address
  }
  tags = var.tags
}