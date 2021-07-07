resource "azurerm_storage_account" "sa-function_app-ceUS" {
  name                     = var.fapp_ceUS["name"]
  resource_group_name      = azurerm_resource_group.rg-replica.name
  location                 = azurerm_resource_group.rg-replica.location
  account_tier             = var.fapp_ceUS["account_tier"]
  account_replication_type = var.fapp_ceUS["account_replication_type"]
}

resource "azurerm_app_service_plan" "asp-ceUS" {
  name                = var.fapp_ceUS["plan_name"]
  location            = azurerm_resource_group.rg-replica.location
  resource_group_name = azurerm_resource_group.rg-replica.name
  kind                = var.fapp_ceUS["kind"]
  reserved            = true

  sku {
    tier = var.fapp_ceUS["sku_tier"]
    size = var.fapp_ceUS["sku_size"]
  }
}

resource "azurerm_function_app" "fa-ceUS" {
  name                       = "fa-ceUS"
  location                   = azurerm_resource_group.rg-replica.location
  resource_group_name        = azurerm_resource_group.rg-replica.name
  app_service_plan_id        = azurerm_app_service_plan.asp-ceUS.id
  storage_account_name       = azurerm_storage_account.sa-function_app-ceUS.name
  storage_account_access_key = azurerm_storage_account.sa-function_app-ceUS.primary_access_key
  os_type                    = var.fapp_ceUS["os_type"]
}