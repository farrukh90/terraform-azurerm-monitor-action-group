# Usage
### This module creates Azure Monitor Action Group with Email 

```
provider "azurerm" {
  features {}
}

module "rg" {
  source   = "farrukh90/resource-group/azurerm"
  name     = "dev"
  location = "westus2"
  tags = {
    Name        = "Alert"
    Environment = "Dev"
    Team        = "DevOps"
    Department  = "IT"
  }
}

module "actiongroup" {
    depends_on = [module.rg]
    source = "farrukh90/monitor-action-group/azurerm""
    resource_group_name     = module.rg.resource_group_name
    actiongroup_name        = "actiongroup"
    email_address           = "email@gmail.com"

    tags = {
    Name        = "Alert"
    Environment = "Dev"
    Team        = "DevOps"
    Department  = "IT"
    }
}

```