terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.53.0"
        }
    }
}
provider "azurerm" {
    features {}
    subscription_id= "9097d0f8-4798-48d3-891f-83da77060e96"
}

resource "azurerm_resource_group" "rg" {
    name = "rg-infra-pipeline-dev"
    location = "east us"
}
 resource "azurerm_storage_account" "stg" {
    name = "stpipelinestg01"
    location = "east us"
    resource_group_name = "rg-infra-pipeline-dev"
    account_tier= "Standard"
    account_replication_type = "LRS"
 }

 resource "azurerm_virtual_network" "vnet" {
    name = "vnet-infra-dev"
    location = "east us"
    resource_group_name = "rg-infra-pipeline-dev"
    address_space = ["10.0.0.0/20"]
 }

 resource "azurerm_subnet" "snet" {
    name = "snet-infra-dev"
    resource_group_name = "rg-infra-pipeline-dev"
    virtual_network_name = "vnet-infra-dev"
    address_prefixes = ["10.0.1.0/28"]
 }
