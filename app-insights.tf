terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.90.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my_app_rg" {
  name = "my-app-insights-rg"
  location = "CentralUS"
}

resource "azurerm_application_insights" "my_app_insights" {
  name = "my-app-insights"
  location = azurerm_resource_group.my_app_rg.location
  resource_group_name = azurerm_resource_group.my_app_rg.name
  application_type = "web"
}

output "ai_connection_string" {
  value = azurerm_application_insights.my_app_insights.connection_string
  sensitive = true
}
